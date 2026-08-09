using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using KarisBrook.Data;
using KarisBrook.Models;
using KarisBrook.Services;
using System;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace KarisBrook.Controllers
{
    [Authorize(Roles = "Merchandiser")]
    public class MerchandiserController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly ArticleGenerator _articleGenerator;
        private readonly ImageService _imageService;
        private readonly IWebHostEnvironment _env;

        public MerchandiserController(
            ApplicationDbContext context,
            ArticleGenerator articleGenerator,
            ImageService imageService,
            IWebHostEnvironment env)
        {
            _context = context;
            _articleGenerator = articleGenerator;
            _imageService = imageService;
            _env = env;
        }

        // GET: /Merchandiser/Products
        public IActionResult Index()
        {
            var products = _context.Products
                .Include(p => p.Category)
                .Include(p => p.Brand)
                .Select(p => new
                {
                    Product = p,
                    Meta = _context.ProductMetas.FirstOrDefault(m => m.ProductId == p.Id)
                })
                .OrderBy(x => x.Product.Id)
                .ToList();

            return View(products);
        }

        // GET: /Merchandiser/Create
        public IActionResult Create()
        {
            ViewBag.Categories = new SelectList(_context.Categories, "Id", "Name");
            ViewBag.Brands = new SelectList(_context.Brands, "Id", "Name");
            return View();
        }

        // POST: /Merchandiser/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(
            string name,
            string description,
            int categoryId,
            int brandId,
            decimal purchasePrice,
            string sourceImageUrl)
        {
            if (!ModelState.IsValid)
            {
                ViewBag.Categories = new SelectList(_context.Categories, "Id", "Name");
                ViewBag.Brands = new SelectList(_context.Brands, "Id", "Name");
                return View();
            }

            // 1. Генерируем артикул
            string article = _articleGenerator.Generate();

            // 2. Скачиваем и сохраняем фото (если ссылка не пустая)
            string imagePath;
            if (!string.IsNullOrWhiteSpace(sourceImageUrl))
            {
                imagePath = await _imageService.DownloadAndSaveAsync(sourceImageUrl, article);
            }
            else
            {
                // Если фото не указано — ставим заглушку
                imagePath = "/product/no-image.jpg";
            }

            // 3. Рассчитываем цены
            decimal price = purchasePrice * 1.2m;
            decimal? oldPrice = price - 950;
            if (oldPrice <= 0) oldPrice = null;

            // 4. Создаём Product
            var product = new Product
            {
                Name = name,
                Description = description,
                Price = price,
                OldPrice = oldPrice,
                ImagePath = imagePath,
                Rating = 0,
                IsNew = true,
                IsSale = oldPrice.HasValue,
                CategoryId = categoryId,
                BrandId = brandId
            };

            _context.Products.Add(product);
            await _context.SaveChangesAsync();

            // 5. Создаём ProductMeta
            var meta = new ProductMeta
            {
                ProductId = product.Id,
                Article = article,
                PurchasePrice = purchasePrice,
                SourceImageUrl = sourceImageUrl,
                ImageUploadDate = DateTime.Now,
                LastPriceUpdate = DateTime.Now
            };

            _context.ProductMetas.Add(meta);
            await _context.SaveChangesAsync();

            return RedirectToAction(nameof(Index));
        }

        // GET: /Merchandiser/Edit/5
        public IActionResult Edit(int id)
        {
            var product = _context.Products.Find(id);
            if (product == null) return NotFound();

            var meta = _context.ProductMetas.FirstOrDefault(m => m.ProductId == id);
            if (meta == null) return NotFound();

            ViewBag.Categories = new SelectList(_context.Categories, "Id", "Name", product.CategoryId);
            ViewBag.Brands = new SelectList(_context.Brands, "Id", "Name", product.BrandId);

            ViewBag.PurchasePrice = meta.PurchasePrice;
            ViewBag.SourceImageUrl = meta.SourceImageUrl;
            ViewBag.Article = meta.Article;

            return View(product);
        }

        // POST: /Merchandiser/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(
            int id,
            string name,
            string description,
            int categoryId,
            int brandId,
            decimal purchasePrice,
            string sourceImageUrl)
        {
            var product = _context.Products.Find(id);
            if (product == null) return NotFound();

            var meta = _context.ProductMetas.FirstOrDefault(m => m.ProductId == id);
            if (meta == null) return NotFound();

            // Обновляем основные поля
            product.Name = name;
            product.Description = description;
            product.CategoryId = categoryId;
            product.BrandId = brandId;

            // Если цена закупки изменилась — пересчитываем цены
            if (meta.PurchasePrice != purchasePrice)
            {
                decimal price = purchasePrice * 1.2m;
                decimal? oldPrice = price - 950;
                if (oldPrice <= 0) oldPrice = null;

                product.Price = price;
                product.OldPrice = oldPrice;
                meta.PurchasePrice = purchasePrice;
                meta.LastPriceUpdate = DateTime.Now;
            }

            // Если поменялась ссылка на фото — обновляем фото
            if (meta.SourceImageUrl != sourceImageUrl && !string.IsNullOrWhiteSpace(sourceImageUrl))
            {
                // Удаляем старое фото (если оно не заглушка)
                if (!string.IsNullOrEmpty(product.ImagePath) && product.ImagePath != "/product/no-image.jpg")
                {
                    string oldFilePath = Path.Combine(_env.WebRootPath, product.ImagePath.TrimStart('/'));
                    if (System.IO.File.Exists(oldFilePath))
                        System.IO.File.Delete(oldFilePath);
                }

                // Скачиваем новое и обновляем путь
                string newImagePath = await _imageService.DownloadAndSaveAsync(sourceImageUrl, meta.Article);
                product.ImagePath = newImagePath;
                meta.SourceImageUrl = sourceImageUrl;
                meta.ImageUploadDate = DateTime.Now;
            }

            await _context.SaveChangesAsync();

            return RedirectToAction(nameof(Index));
        }

        // POST: /Merchandiser/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Delete(int id)
        {
            var product = _context.Products.Find(id);
            if (product == null) return NotFound();

            var meta = _context.ProductMetas.FirstOrDefault(m => m.ProductId == id);
            if (meta != null)
            {
                // Удаляем файл фото, если он существует и не заглушка
                if (!string.IsNullOrEmpty(product.ImagePath) && product.ImagePath != "/product/no-image.jpg")
                {
                    string filePath = Path.Combine(_env.WebRootPath, product.ImagePath.TrimStart('/'));
                    if (System.IO.File.Exists(filePath))
                        System.IO.File.Delete(filePath);
                }

                _context.ProductMetas.Remove(meta);
            }

            _context.Products.Remove(product);
            await _context.SaveChangesAsync();

            return RedirectToAction(nameof(Index));
        }
    }
}