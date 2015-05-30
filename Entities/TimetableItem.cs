using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FitnessCenter.Entities
{
    public class TimetableItem
    {
        public int Id { get; set; }

        public Room Room { get; set; }

        public Activity Activity { get; set; }

        public Employee Employee { get; set; }

        [Display(Name = "Зал")]
        [Required]
        public int RoomId { get; set; }

        [Display(Name = "Занятие")]
        [Required]
        public int ActivityId { get; set; }

        [Display(Name = "Инструктор")]
        [Required]
        public int EmployeeId { get; set; }

        [Display(Name = "Время конца")]
        [DisplayFormat(DataFormatString = @"{0:hh\:mm}", ApplyFormatInEditMode = true)]
        [DataType(System.ComponentModel.DataAnnotations.DataType.Time)]
        public TimeSpan EndTime 
        {
            get
            {
                return Activity != null && Activity.Duration.HasValue ? StartTime + Activity.Duration.Value : StartTime;
            }
        }

        [Display(Name = "Время начала")]
        [Required]
        [DisplayFormat(DataFormatString = @"{0:hh\:mm}", ApplyFormatInEditMode = true)]
        [DataType(System.ComponentModel.DataAnnotations.DataType.Time)]
        public TimeSpan StartTime { get; set; }

        [Display(Name = "День недели")]
        [Required]
        public int DayOfWeek { get; set; }

        [Display(Name = "День недели")]
        [Required]
        public string DayOfWeekString
        {
            get
            {
                switch (DayOfWeek)
                {
                    case 1:
                        return "Понедельник";
                    case 2:
                        return "Вторник";
                    case 3:
                        return "Среда";
                    case 4:
                        return "Четверг";
                    case 5:
                        return "Пятница";
                    case 6:
                        return "Суббота";
                    case 7:
                        return "Воскресенье";
                }
                return "";
            }
        }

        public string Info
        {
            get
            {
                return String.Format("<p>{1}{0}{2}{0}{3}{0}{4}</p>", 
                    "<br/>", 
                    Activity.Name, 
                    Room.Name, 
                    Employee.FullName,
                    String.Format(@"{0:hh\:mm} - {1:hh\:mm}", StartTime, EndTime));
            }
        }
    }
}
