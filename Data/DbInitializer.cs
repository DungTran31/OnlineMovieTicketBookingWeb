using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using OnlineMovieTicketBookingWeb.Models;
using System;
using System.Linq;

namespace OnlineMovieTicketBookingWeb.Data
{
    public class DbInitializer
    {
        public static void Initialize(IServiceProvider serviceProvider)
        {
            using (var context = new MovieTicketBookingContext(serviceProvider
                .GetRequiredService<DbContextOptions<MovieTicketBookingContext>>()))
            {
                context.Database.EnsureCreated();

                // Check if any data exists in the relevant tables
                if (context.SeatTypes.Any() || context.Movies.Any() || context.Screenings.Any())
                {
                    return; // DB has been seeded
                }

                context.SaveChanges();
            }
        }
    }
}
