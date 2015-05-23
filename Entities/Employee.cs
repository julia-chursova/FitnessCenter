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
        public string Name { get; set; }
        [Required]
        public string Surname { get; set; }
        public string MiddleName { get; set; }
        public string Description { get; set; }
        public List<File> FileNames { get; set; }

        public Employee()
        {
            FileNames = new List<File>();
        }
    }
}
