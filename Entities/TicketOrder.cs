using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FitnessCenter.Entities
{
    public class TicketOrder
    {
        public int Id { get; set; }

        [Required]
        [Display(Name = "Клубная карта")]
        public int TicketId { get; set; }

        [Display(Name = "Клубная карта")]
        public Ticket Ticket { get; set; }

        [Required]
        [Display(Name = "Владелец")]
        public int ClientId { get; set; }
        
        [Display(Name = "Владелец")]
        public Client Client { get; set; }

        [Required]
        [Display(Name = "Продал")]
        public int ManagerId { get; set; }
        
        [Display(Name = "Продал")]
        public Employee Manager { get; set; }

        [Required]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        [Display(Name = "Дата начала действия")]
        public DateTime ActivationDate { get; set; }

        [Required]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        [Display(Name = "Дата продажи")]
        public DateTime OrderDate { get; set; }

        public TicketOrder()
        {
            OrderDate = DateTime.Now.Date;
            ActivationDate = DateTime.Now.Date;
        }
    }
}
