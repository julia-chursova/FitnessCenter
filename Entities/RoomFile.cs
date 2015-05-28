﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FitnessCenter.Entities
{
    public class RoomFile
    {
        public Room Room { get; set; }

        public string FileName { get; set; }

        public string Path
        {
            get
            {
                return "../Content/Images/" + FileName;
            }
        }

        public string Path2
        {
            get
            {
                return "../../Content/Images/" + FileName;
            }
        }
    }
}
