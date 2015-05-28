using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FitnessCenter.Entities
{
    public enum Genders
    {
        Male = 0,
        Female = 1
    }

    public class Client
    {
        public int Id { get; set; }        

        [Required]
        [Display(Name = "Фамилия")]
        public string Surname { get; set; }

        [Required]
        [Display(Name = "Имя")]
        public string Name { get; set; }
        
        [Display(Name = "Отчество")]
        public string MiddleName { get; set; }

        [Display(Name = "Дата рождения")]
        public DateTime? BirthdayDate { get; set; }

        [Display(Name = "Адрес")]
        public string Address { get; set; }

        [DataType(System.ComponentModel.DataAnnotations.DataType.PhoneNumber)]
        [Display(Name = "Телефон")]
        [Phone]
        public string Phone { get; set; }

        [Display(Name = "Пол")]
        public Genders? Gender { get; set; }
    }
}
