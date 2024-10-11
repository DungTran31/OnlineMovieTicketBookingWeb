using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace OnlineMovieTicketBookingWeb.Models
{
    public class SoldTicket
    {
        [Key]
        [Required(ErrorMessage = "Mã vé không được để trống")]
        [StringLength(50)]
        [Display(Name = "Mã vé")]
        public string? Id { get; set; }

        [Required(ErrorMessage = "Ngày bán không được để trống")]
        [Display(Name = "Ngày bán")]
        public DateTime SoldDate { get; set; }

        [Required(ErrorMessage = "Tổng giá không được để trống")]
        [Range(0, int.MaxValue, ErrorMessage = "Tổng giá phải là một số không âm")]
        [Display(Name = "Tổng giá")]
        public int TotalPrice { get; set; }

        [Required]
        [StringLength(50)]
        [Display(Name = "Mã suất chiếu")]
        public string? ScreeningId { get; set; }
        [ForeignKey("ScreeningId")]
        public Screening? Screening { get; set; }

        [Required]
        [Display(Name = "Mã giá vé")]
        public int TicketPriceId { get; set; }
        [ForeignKey("TicketPriceId")]
        public TicketPrice? TicketPrice { get; set; }

        [Required]
        [Display(Name = "Mã ghế")]
        public int SeatId { get; set; }
        [ForeignKey("SeatId")]
        public Seat? Seat { get; set; }

        [Required]
        [StringLength(450)]
        [Display(Name = "Mã nhân viên")]
        public string? StaffId { get; set; }
        [ForeignKey("StaffId")]
        public Staff? Staff { get; set; }
    }
}
