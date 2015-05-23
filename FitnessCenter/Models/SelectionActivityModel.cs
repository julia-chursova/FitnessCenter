using FitnessCenter.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FitnessCenter.Models
{
    public class SelectionActivityModel
    {
        public bool IsSelected { get; set; }

        public Activity Activity { get; set; }
    }
}