using FitnessCenter.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FitnessCenter.Models
{
    public class EmployeeViewModel
    {
        public Employee Model { get; set; }

        public HttpPostedFileBase File { get; set; }
    }
}