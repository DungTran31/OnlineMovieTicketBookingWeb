using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace OnlineMovieTicketBookingWeb.Models
{
    public class Seat
    {
        public Seat()
        {
            SoldTickets = new HashSet<SoldTicket>();
        }
        [Key]
        [Display(Name = "Mã ghế")]
        public int Id { get; set; }

        [Display(Name = "Vị trí hàng")]
        [Required(ErrorMessage = "Vị trí hàng không được để trống")]
        [StringLength(50, ErrorMessage = "Vị trí hàng không được vượt quá 50 ký tự")]
        public string? RowPosition { get; set; }

        [Display(Name = "Vị trí ghế")]
        [Required(ErrorMessage = "Vị trí ghế không được để trống")]
        [Range(1, int.MaxValue, ErrorMessage = "Vị trí ghế phải là số dương")]
        public int SeatPosition { get; set; }

        [Display(Name = "Trạng thái ghế")]
        [Required(ErrorMessage = "Trạng thái ghế không được để trống")]
        [StringLength(10, ErrorMessage = "Trạng thái ghế không được vượt quá 10 ký tự")]
        public string? IsChosen { get; set; }

        [Display(Name = "Mã phòng chiếu")]
        [Required(ErrorMessage = "Phòng chiếu không được để trống")]
        public int ScreeningRoomId { get; set; }
        [ForeignKey("ScreeningRoomId")]
        public ScreeningRoom? ScreeningRoom { get; set; }

        [Display(Name = "Mã loại ghế")]
        [Required(ErrorMessage = "Loại ghế không được để trống")]
        [StringLength(50, ErrorMessage = "Mã loại ghế không được vượt quá 50 ký tự")]
        public string? SeatTypeId { get; set; }
        [ForeignKey("SeatTypeId")]
        public SeatType? SeatType { get; set; }

        public ICollection<SoldTicket> SoldTickets { get; set; }
    }
}
