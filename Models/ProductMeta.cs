using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace KarisBrook.Models
{
    // Таблица, которая расширяет Product учётными данными (для товароведа)
    public class ProductMeta
    {
        [Key]
        public int Id { get; set; }

        // Внешний ключ к Product (один к одному)
        [ForeignKey("Product")]
        public int ProductId { get; set; }
        public virtual Product Product { get; set; }

        // Артикул — генерируем при создании, он уникален
        [Required]
        [MaxLength(50)]
        public string Article { get; set; }

        // Цена закупки (вводит товаровед)
        [Column(TypeName = "decimal(18,2)")]
        public decimal PurchasePrice { get; set; }

        // Оригинальная ссылка на фото (например, с Яндекс.Диска)
        [MaxLength(500)]
        public string SourceImageUrl { get; set; }

        // Дата загрузки фото (ставится автоматически)
        public DateTime ImageUploadDate { get; set; }

        // Дата последнего обновления цены (ставится автоматически)
        public DateTime LastPriceUpdate { get; set; }
    }
}