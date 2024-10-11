using System.ComponentModel.DataAnnotations;

namespace OnlineMovieTicketBookingWeb.Models
{
    public class ScreeningRoom
    {
        public ScreeningRoom()
        {
            Screenings = new HashSet<Screening>();
            Seats = new HashSet<Seat>();
        }
        [Key]
        [Required(ErrorMessage = "Mã phòng chiếu không được để trống")]
        [Display(Name = "Mã phòng chiếu")]
        public int Id { get; set; }

        [Display(Name = "Số hàng ghế")]
        [Required(ErrorMessage = "Số hàng ghế không được để trống")]
        [Range(1, int.MaxValue, ErrorMessage = "Số hàng ghế phải là số dương")]
        public int RowCount { get; set; }

        [Display(Name = "Số ghế")]
        [Required(ErrorMessage = "Số ghế không được để trống")]
        [Range(1, int.MaxValue, ErrorMessage = "Số ghế phải là số dương")]
        public int SeatCount { get; set; }

        public ICollection<Screening>? Screenings { get; set; }
        public ICollection<Seat>? Seats { get; set; }
    }
}
