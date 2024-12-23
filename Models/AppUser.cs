﻿using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;

namespace OnlineMovieTicketBookingWeb.Models
{
    public class AppUser : IdentityUser
    {
        [StringLength(50)]
        public string? Discriminator { get; set; } // Discriminator column to differentiate user types


        [Display(Name = "Địa chỉ")]
        [StringLength(255, ErrorMessage = "Địa chỉ không được vượt quá 255 ký tự")]
        public string? Address { get; set; }
        [Display(Name = "Ngày sinh")]
        [DataType(DataType.Date, ErrorMessage = "Ngày sinh không hợp lệ")]
        public DateTime DateOfBirth { get; set; }
    }
}
