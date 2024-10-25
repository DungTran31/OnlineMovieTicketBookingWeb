using System.ComponentModel.DataAnnotations;

namespace OnlineMovieTicketBookingWeb.Models
{
    public class MovieGenre
    {
        [Key]
        [Display(Name = "Mã thể loại phim")]
        public int? Id { get; set; }
        [Display(Name = "Tên thể loại phim")]
        public string? Name { get; set; }
    }
}
