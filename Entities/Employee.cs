using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FitnessCenter.Entities
{
    public class Employee
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
        public string MiddleName { get; set; }
        public string Description { get; set; }
        public List<string> FileNames { get; set; }

        public Employee()
        {
            FileNames = new List<string>();
        }
    }
}
