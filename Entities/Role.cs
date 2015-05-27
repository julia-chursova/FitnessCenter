using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FitnessCenter.Entities
{
    public enum Roles
    {
        Administrator = 1,
        Manager = 2,
        Accounting = 4
    }

    public class Role
    {
        public int Id { get; set; }

        public string Name { get; set; }
    }
}
