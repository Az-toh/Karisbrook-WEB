using System;
using System.Linq;
using KarisBrook.Data;

namespace KarisBrook.Services
{
    public class ArticleGenerator
    {
        private readonly ApplicationDbContext _context;

        public ArticleGenerator(ApplicationDbContext context)
        {
            _context = context;
        }

        public string Generate()
        {
            // Формат: ART-ГГГГММДД-XXX
            string datePart = DateTime.Now.ToString("yyyyMMdd");
            string prefix = $"ART-{datePart}-";

            // Находим все артикулы с сегодняшней датой
            var existingArticles = _context.ProductMetas
                .Where(m => m.Article.StartsWith(prefix))
                .Select(m => m.Article)
                .ToList();

            int maxNumber = 0;
            foreach (var article in existingArticles)
            {
                // Извлекаем числовой суффикс из артикула
                string suffix = article.Substring(prefix.Length);
                if (int.TryParse(suffix, out int num) && num > maxNumber)
                {
                    maxNumber = num;
                }
            }

            int nextNumber = maxNumber + 1;
            return $"{prefix}{nextNumber:D3}"; // D3 -> 001, 002, ...
        }
    }
}