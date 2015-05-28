using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FitnessCenter.Entities
{
    public class Room
    {
        public int ID { get; set; }

        [Required]
        [Display(Name = "Название")]
        public string Name { get; set; }

        [Display(Name = "Описание")]
        [DataType(System.ComponentModel.DataAnnotations.DataType.MultilineText)]
        public string Description { get; set; }

        [Display(Name = "Вместимость")]
        public int? Capacity { get; set; }

        [Display(Name = "Площадь")]
        [DisplayFormat(DataFormatString = "{0:F2}", ApplyFormatInEditMode = true)]
        public decimal? Area { get; set; }

        [Display(Name = "Фотографии")]
        public List<RoomFile> FileNames { get; set; }

        public Room()
        {
            FileNames = new List<RoomFile>();
        }
    }
}
