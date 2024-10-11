using System.ComponentModel.DataAnnotations;

namespace OnlineMovieTicketBookingWeb.Models
{
    public class SeatType
    {
        public SeatType()
        {
            Seats = new HashSet<Seat>();
        }
        [Key]
        [Required(ErrorMessage = "Mã loại ghế không được để trống")]
        [StringLength(50)]
        [Display(Name = "Mã loại ghế")]
        public string? Id { get; set; }

        [Required(ErrorMessage = "Tên loại ghế không được để trống")]
        [StringLength(100, ErrorMessage = "Tên loại ghế không được vượt quá 100 ký tự")]
        [Display(Name = "Tên loại ghế")]
        public string? SeatName { get; set; }

        [Required(ErrorMessage = "Phụ phí không được để trống")]
        [Range(0, int.MaxValue, ErrorMessage = "Phụ phí phải là một số không âm")]
        [Display(Name = "Phụ phí")]
        public int Surcharge { get; set; }

        public ICollection<Seat>? Seats { get; set; }
    }
}
