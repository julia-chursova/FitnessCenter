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

        public string Name { get; set; }

        public decimal Cost { get; set; }

        [DataType(System.ComponentModel.DataAnnotations.DataType.Date)]
        public DateTime ValidFrom { get; set; }

        [DataType(System.ComponentModel.DataAnnotations.DataType.Date)]
        public DateTime ValidTo { get; set; }

        [DataType(System.ComponentModel.DataAnnotations.DataType.Time)]
        public DateTime AvailableFrom { get; set; }

        [DataType(System.ComponentModel.DataAnnotations.DataType.Time)]
        public DateTime AvailableTo { get; set; }

        public List<Activity> Activities { get; set; }

        public Ticket()
        {
            Activities = new List<Activity>();
        }
    }
}
