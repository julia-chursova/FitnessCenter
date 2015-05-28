using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FitnessCenter.Entities
{
    public class Ticket
    {
        public int Id { get; set; }

        [Required]
        [Display(Name = "Название")]
        public string Name { get; set; }

        [DisplayFormat(DataFormatString = "{0:F2}", ApplyFormatInEditMode = true)]
        [Display(Name = "Стоимость")]
        public decimal Cost { get; set; }

        [Display(Name = "Время посещения (с)")]
        [DisplayFormat(DataFormatString = @"{0:hh\:mm}", ApplyFormatInEditMode = true)]
        [DataType(System.ComponentModel.DataAnnotations.DataType.Time)]
        public TimeSpan? AvailableFrom { get; set; }

        [Display(Name = "Время посещения (по)")]
        [DisplayFormat(DataFormatString = @"{0:hh\:mm}", ApplyFormatInEditMode = true)]
        [DataType(System.ComponentModel.DataAnnotations.DataType.Time)]
        public TimeSpan? AvailableTo { get; set; }

        [Required]
        [Display(Name = "Продолжительность")]
        public int Duration { get; set; }
    }
}
