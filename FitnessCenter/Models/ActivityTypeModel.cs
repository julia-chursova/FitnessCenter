using FitnessCenter.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FitnessCenter.Models
{
    public class ActivityTypeModel
    {
        public ActivityType ActivityType { get; set; }

        public List<SelectionActivityModel> Activities { get; set; }
    }
}