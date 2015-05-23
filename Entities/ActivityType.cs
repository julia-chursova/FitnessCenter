using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FitnessCenter.Entities
{
    public class ActivityType
    {
        public int Id { get; set; }

        public string Name { get; set; }

        public List<Activity> Activities { get; set; }

        public ActivityType()
        {
            Activities = new List<Activity>();
        }
    }
}
