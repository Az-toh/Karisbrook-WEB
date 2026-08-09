using System;
using System.IO;
using System.Net.Http;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Logging;

namespace KarisBrook.Services
{
    public class ImageService
    {
        private readonly IWebHostEnvironment _env;
        private readonly ILogger<ImageService> _logger;
        private readonly HttpClient _httpClient;

        public ImageService(IWebHostEnvironment env, ILogger<ImageService> logger)
        {
            _env = env;
            _logger = logger;
            _httpClient = new HttpClient();
            _httpClient.Timeout = TimeSpan.FromSeconds(30);
        }

        public async Task<string> DownloadAndSaveAsync(string imageUrl, string article)
        {
            // Проверяем, что ссылка не пустая
            if (string.IsNullOrWhiteSpace(imageUrl))
                throw new ArgumentException("Ссылка на фото не может быть пустой.");

            // Определяем расширение файла из URL или из Content-Type
            string extension = GetFileExtension(imageUrl);
            if (string.IsNullOrEmpty(extension))
                throw new ArgumentException("Не удалось определить тип файла. Убедитесь, что ссылка ведёт на изображение.");

            // Формируем имя файла: Артикул.расширение
            string fileName = $"{article}{extension}";
            string productFolder = Path.Combine(_env.WebRootPath, "product");
            Directory.CreateDirectory(productFolder); // гарантируем, что папка существует

            string filePath = Path.Combine(productFolder, fileName);

            // Скачиваем файл
            try
            {
                using var response = await _httpClient.GetAsync(imageUrl);
                response.EnsureSuccessStatusCode();

                // Проверяем Content-Type
                string contentType = response.Content.Headers.ContentType?.MediaType;
                if (!IsAllowedImageType(contentType))
                {
                    throw new ArgumentException($"Тип файла не поддерживается: {contentType}. Допустимы: JPEG, PNG, GIF, WebP.");
                }

                // Сохраняем в файл
                using var fileStream = new FileStream(filePath, FileMode.Create);
                await response.Content.CopyToAsync(fileStream);

                _logger.LogInformation($"Фото сохранено: {fileName}");
                return $"/product/{fileName}";
            }
            catch (HttpRequestException ex)
            {
                _logger.LogError(ex, "Ошибка при скачивании фото");
                throw new Exception("Не удалось скачать фото по указанной ссылке. Проверьте URL или доступность сервера.");
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Ошибка при сохранении фото");
                throw;
            }
        }

        private string GetFileExtension(string url)
        {
            // Пробуем определить расширение по URL
            if (url.Contains('.'))
            {
                string[] parts = url.Split('?')[0].Split('.');
                if (parts.Length > 1)
                {
                    string ext = parts[parts.Length - 1].ToLower();
                    if (ext == "jpg" || ext == "jpeg" || ext == "png" || ext == "gif" || ext == "webp")
                        return "." + ext;
                }
            }

            // Если не удалось — попробуем по умолчанию .jpg, но это рискованно
            // Лучше бросить исключение, чем сохранить с неправильным расширением
            throw new ArgumentException("Не удалось определить расширение файла. Убедитесь, что ссылка ведёт на изображение.");
        }

        private bool IsAllowedImageType(string contentType)
        {
            return contentType == "image/jpeg" ||
                   contentType == "image/png" ||
                   contentType == "image/gif" ||
                   contentType == "image/webp";
        }
    }
}