using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;
using GuildQuest.UI.Helpers.Enums;

namespace GuildQuest.UI.Models
{
    public class SearchViewModel
    {
        public SearchViewModel()
        {
            SetupSearchParms();
        }
        public VehicleTypeEnum SearchType { get; set; }

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

        private void SetupSearchParms()
        {
            SearchArg = string.Empty;

           var yearsMin = new List<SelectListItem>();
            var pricesMin = new List<SelectListItem>();
            var yearsMax = new List<SelectListItem>();
            var pricesMax = new List<SelectListItem>();

            SelectListItem i1 = new SelectListItem()
            {
                Text = "No Min",
                Value = "1900"
            };
            yearsMin.Add(i1);

            SelectListItem i2 = new SelectListItem()
            {
                Text = "No Max",
                Value = "9999"
            };
            yearsMax.Add(i2);

            for (int i = 1990; i <= DateTime.Today.Year + 1; i++)
            {
                SelectListItem it = new SelectListItem()
                {
                    Text = i.ToString(),
                    Value = i.ToString()
                };
                yearsMin.Add(it);
                yearsMax.Add(it);
            }

            SelectListItem i3 = new SelectListItem()
            {
                Text = "No Min",
                Value = "0"
            };

            pricesMin.Add(i3);

            SelectListItem i4 = new SelectListItem()
            {
                Text = "No Max",
                Value = "999999999"
            };

            pricesMax.Add(i4);

            for (int i = 0; i < 100000; i = i + 10000)
            {
                SelectListItem it = new SelectListItem()
                {
                    Text = i.ToString(),
                    Value = i.ToString()
                };

                pricesMin.Add(it);
                pricesMax.Add(it);
            }
           
            MinYears = new SelectList(yearsMin, "Value", "Text");
            MaxYears = new SelectList(yearsMax, "Value", "Text"); ;
            MinPrices = new SelectList(pricesMin, "Value", "Text");
            MaxPrices = new SelectList(pricesMax, "Value", "Text");
        }
    }
}