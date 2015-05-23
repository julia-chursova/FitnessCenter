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
        public string Name { get; set; }

        public decimal Cost { get; set; }

        public ActivityType ActivityType { get; set; }

        public int ActivityTypeId { get; set; }

        [DataType(System.ComponentModel.DataAnnotations.DataType.Time)]
        public TimeSpan? AvailableFrom { get; set; }

        [DataType(System.ComponentModel.DataAnnotations.DataType.Time)]
        public TimeSpan? AvailableTo { get; set; }

        public Ticket()
        {
        }
    }
}
