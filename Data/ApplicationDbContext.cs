using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using KarisBrook.Models;

namespace KarisBrook.Data
{
    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        public DbSet<Product> Products { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Brand> Brands { get; set; }
        public DbSet<Review> Reviews { get; set; }
        public DbSet<CartItem> CartItems { get; set; } // <-- ЭТО ДОЛЖНО БЫТЬ
        public DbSet<Order> Orders { get; set; }
        public DbSet<OrderItem> OrderItems { get; set; }
        public DbSet<WishlistItem> WishlistItems { get; set; }
        public DbSet<ProductMeta> ProductMetas { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.Entity<ProductMeta>()
    .HasOne(pm => pm.Product)
    .WithOne()
    .HasForeignKey<ProductMeta>(pm => pm.ProductId)
    .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<ProductMeta>()
                .HasIndex(pm => pm.Article)
                .IsUnique();

            // Здесь можно настроить связи
        }
    }
}