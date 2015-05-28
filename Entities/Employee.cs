using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FitnessCenter.Entities
{
    public class Employee
    {
        public int ID { get; set; }        

        [Required]
        [Display(Name = "Фамилия")]
        public string Surname { get; set; }

        [Required]
        [Display(Name = "Имя")]
        public string Name { get; set; }

        [Display(Name = "Отчество")]
        public string MiddleName { get; set; }
        
        public EmployeePosition Position { get; set; }

        [Required]
        [Display(Name = "Должность")]
        public int PositionId { get; set; }

        [DisplayFormat(DataFormatString = "{0:F2}", ApplyFormatInEditMode = true)]
        [Display(Name = "Зарплата")]
        public decimal? Salary { get; set; }

        [Display(Name = "Адрес")]
        public string Address { get; set; }

        [DataType(System.ComponentModel.DataAnnotations.DataType.PhoneNumber)]
        [Display(Name = "Телефон")]
        [Phone]
        public string Phone { get; set; }

        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        [Display(Name = "Дата рождения")]
        public DateTime? BirthdayDate { get; set; }

        [Display(Name = "Образование")]
        public string Education { get; set; }

        [Required]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        [Display(Name = "Дата приема на работу")]
        public DateTime AcceptanceDate { get; set; }

        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        [Display(Name = "Дата увольнения")]
        public DateTime? LeaveDate { get; set; }        

        [DataType(System.ComponentModel.DataAnnotations.DataType.MultilineText)]
        [Display(Name = "Описание")]
        public string Description { get; set; }

        [Display(Name = "Фотографии")]
        public List<EmployeeFile> FileNames { get; set; }

        public Employee()
        {
            FileNames = new List<EmployeeFile>();
            AcceptanceDate = DateTime.Now.Date;
        }
    }
}
