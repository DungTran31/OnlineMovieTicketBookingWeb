using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;

namespace OnlineMovieTicketBookingWeb.Models
{
    public class Staff : AppUser
    {
        public Staff()
        {
            Id = Guid.NewGuid().ToString();
            SoldTickets = new HashSet<SoldTicket>();
        }

        [Required(ErrorMessage = "Họ và tên không được để trống")]
        [StringLength(100, ErrorMessage = "Họ và tên không được vượt quá 100 ký tự")]
        [Display(Name = "Họ và tên")]
        public string? FullName { get; set; }

        [Display(Name = "Số CMND/CCCD")]
        [Required(ErrorMessage = "Số CMND/CCCD không được để trống")]
        [StringLength(50, ErrorMessage = "Số CMND/CCCD không được vượt quá 50 ký tự")]
        public string? IdentityNumber { get; set; }

        [StringLength(15, ErrorMessage = "Số điện thoại không được vượt quá 15 ký tự")]
        [Display(Name = "Số điện thoại")]
        public new string? PhoneNumber { get; set; }

        [StringLength(100)]
        [EmailAddress(ErrorMessage = "Địa chỉ email không hợp lệ")]
        [Display(Name = "Email")]
        public new string? Email { get; set; }

        [Required(ErrorMessage = "Ngày tuyển dụng không được để trống")]
        [Display(Name = "Ngày tuyển dụng")]
        public DateTime? HireDate { get; set; }

        [StringLength(10, ErrorMessage = "Giới tính không được vượt quá 10 ký tự")]
        [Display(Name = "Giới tính")]
        public string? Gender { get; set; }

        [Display(Name = "Trạng thái hoạt động")]
        public bool IsActive { get; set; }

        [StringLength(50, ErrorMessage = "Vai trò không được vượt quá 50 ký tự")]
        [Display(Name = "Vai trò")]
        public string? Role { get; set; }

        public ICollection<SoldTicket> SoldTickets { get; set; }
    }
}
