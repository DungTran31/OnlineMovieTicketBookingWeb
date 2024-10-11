using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using OnlineMovieTicketBookingWeb.Models;

namespace OnlineMovieTicketBookingWeb.Data
{
    public class MovieTicketBookingContext : IdentityDbContext<IdentityUser, IdentityRole, string>
    {
        public MovieTicketBookingContext(DbContextOptions<MovieTicketBookingContext> options) : base(options) { }

        public virtual DbSet<SeatType> SeatTypes { get; set; }
        public virtual DbSet<TicketPrice> TicketPrices { get; set; }
        public virtual DbSet<Customer> Customers { get; set; }
        public virtual DbSet<ScreeningRoom> ScreeningRooms { get; set; }
        public virtual DbSet<Seat> Seats { get; set; }
        public virtual DbSet<Movie> Movies { get; set; }
        public virtual DbSet<Screening> Screenings { get; set; }
        public virtual DbSet<Staff> Staffs { get; set; }
        public virtual DbSet<SoldTicket> SoldTickets { get; set; }
        public virtual DbSet<BookedTicket> BookedTickets { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

           

            // Define composite keys for Identity-related tables
            modelBuilder.Entity<IdentityUserLogin<string>>(entity =>
            {
                entity.HasKey(e => new { e.LoginProvider, e.ProviderKey });
            });

            modelBuilder.Entity<IdentityUserRole<string>>(entity =>
            {
                entity.HasKey(e => new { e.UserId, e.RoleId });
            });

            modelBuilder.Entity<IdentityUserToken<string>>(entity =>
            {
                entity.HasKey(e => new { e.UserId, e.LoginProvider, e.Name });
            });

            // Map Identity tables to custom table names (optional)
            modelBuilder.Entity<IdentityUser>().ToTable("Users");
            modelBuilder.Entity<IdentityRole>().ToTable("Roles");
            modelBuilder.Entity<IdentityUserRole<string>>().ToTable("UserRoles");
            modelBuilder.Entity<IdentityUserClaim<string>>().ToTable("UserClaims");
            modelBuilder.Entity<IdentityUserLogin<string>>().ToTable("UserLogins");
            modelBuilder.Entity<IdentityRoleClaim<string>>().ToTable("RoleClaims");
            modelBuilder.Entity<IdentityUserToken<string>>().ToTable("UserTokens");

            // Map your application-specific entities to their respective tables
            modelBuilder.Entity<SeatType>().ToTable(nameof(SeatType));
            modelBuilder.Entity<TicketPrice>().ToTable(nameof(TicketPrice));
            modelBuilder.Entity<Customer>().ToTable(nameof(Customer));
            modelBuilder.Entity<ScreeningRoom>().ToTable(nameof(ScreeningRoom));
            modelBuilder.Entity<SoldTicket>()
                .HasOne(st => st.Seat)
                .WithMany(s => s.SoldTickets)
                .HasForeignKey(st => st.SeatId)
                .OnDelete(DeleteBehavior.ClientSetNull); // Ngăn chặn xóa cascade

            modelBuilder.Entity<SoldTicket>()
                .HasOne(st => st.Screening)
                .WithMany(s => s.SoldTickets)
                .HasForeignKey(st => st.ScreeningId)
                .OnDelete(DeleteBehavior.ClientSetNull); // Ngăn chặn xóa cascade

            modelBuilder.Entity<SoldTicket>()
                .HasOne(st => st.TicketPrice)
                .WithMany(tp => tp.SoldTickets)
                .HasForeignKey(st => st.TicketPriceId)
                .OnDelete(DeleteBehavior.ClientSetNull); // Ngăn chặn xóa cascade

            modelBuilder.Entity<SoldTicket>()
                .HasOne(st => st.Staff)
                .WithMany(s => s.SoldTickets)
                .HasForeignKey(st => st.StaffId)
                .OnDelete(DeleteBehavior.ClientSetNull); // Ngăn chặn xóa cascade
            modelBuilder.Entity<BookedTicket>(entity =>
            {
                entity.HasKey(e => new { e.SoldTicketId, e.CustomerId });

            });
            modelBuilder.Entity<Seat>().ToTable(nameof(Seat));
            modelBuilder.Entity<Movie>().ToTable(nameof(Movie));
            modelBuilder.Entity<Screening>().ToTable(nameof(Screening));
            modelBuilder.Entity<Staff>().ToTable(nameof(Staff));
            modelBuilder.Entity<SoldTicket>().ToTable(nameof(SoldTicket));
            modelBuilder.Entity<BookedTicket>().ToTable(nameof(BookedTicket));

            // Remove "AspNet" prefix from Identity tables (if they are auto-generated with the prefix)
            foreach (var entityType in modelBuilder.Model.GetEntityTypes())
            {
                var tableName = entityType.GetTableName();
                if (tableName != null && tableName.StartsWith("AspNet"))
                {
                    entityType.SetTableName(tableName.Substring(6));
                }
            }
        }
    }
}
