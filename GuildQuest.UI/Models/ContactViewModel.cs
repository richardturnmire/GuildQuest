using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace GuildQuest.UI.Models
{
    public class ContactViewModel
    {
        [DataType(DataType.Text)]
        [Required]
        public string Name { get; set; }

        [DataType(DataType.EmailAddress)]
        [Required]
        public string Email { get; set; }

        [DataType(DataType.PhoneNumber)]
        public string Phone { get; set; }

        [DataType(DataType.Text)]
        [Required]
        public string Subject { get; set; }

        [DataType(DataType.MultilineText)]
        [Required]
        public string Message { get; set; }
    }
}