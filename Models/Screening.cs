using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace OnlineMovieTicketBookingWeb.Models
{
    public class Screening
    {
        public Screening()
        {
            SoldTickets = new HashSet<SoldTicket>();
        }
        [Key]
        [Display(Name = "Mã suất chiếu")]
        [StringLength(50, ErrorMessage = "Mã suất chiếu không được vượt quá 50 ký tự")]
        public string? Id { get; set; }

        [Display(Name = "Thời gian bắt đầu")]
        [Required(ErrorMessage = "Thời gian bắt đầu không được để trống")]
        public TimeSpan StartTime { get; set; }

        [Display(Name = "Thời gian kết thúc")]
        [Required(ErrorMessage = "Thời gian kết thúc không được để trống")]
        public TimeSpan EndTime { get; set; }

        [Display(Name = "Ngày chiếu")]
        [Required(ErrorMessage = "Ngày chiếu không được để trống")]
        public DateTime ScreeningDate { get; set; }

        [Display(Name = "Định dạng phim")]
        [StringLength(100, ErrorMessage = "Định dạng phim không được vượt quá 100 ký tự")]
        public string? MovieFormat { get; set; }

        [Display(Name = "Mã phim")]
        [Required(ErrorMessage = "Mã phim không được để trống")]
        [StringLength(50, ErrorMessage = "Mã phim không được vượt quá 50 ký tự")]
        public string? MovieId { get; set; }

        [ForeignKey("MovieId")]
        public Movie? Movie { get; set; }

        [Display(Name = "Mã phòng chiếu")]
        [Required(ErrorMessage = "Mã phòng chiếu không được để trống")]
        public int ScreeningRoomId { get; set; }

        [ForeignKey("ScreeningRoomId")]
        public ScreeningRoom? ScreeningRoom { get; set; }

        public ICollection<SoldTicket> SoldTickets { get; set; }
    }
}
