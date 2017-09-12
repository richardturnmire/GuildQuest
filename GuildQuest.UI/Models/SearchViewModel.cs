using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GuildQuest.UI.Helpers.Enums;

namespace GuildQuest.UI.Models
{
    public class SearchViewModel
    {
        public SearchTypeEnum SearchType { get; set; }

        [DataType(DataType.Text)]
        public string SearchArg { get; set; }

       [DisplayName("Price")]
        public string SearchMinPrice { get; set; }
        
        [DisplayName("Maximum Price")]
        public string SearchMaxPrice { get; set; }

        [DisplayName("Year")]
        public string SearchMinYear { get; set; }

        [DisplayName("Maximum Year")]
        public string SearchMaxYear { get; set; }

        public SelectList MinYears { get; set; }
        public SelectList MaxYears { get; set; }
        public SelectList MinPrices { get; set; }
        public SelectList MaxPrices { get; set; }
    }
}