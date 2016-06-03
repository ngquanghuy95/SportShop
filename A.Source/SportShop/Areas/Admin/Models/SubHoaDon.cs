using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SportShop.Areas.Admin.Models
{
    public class SubHoaDon
    {
        public int Mahoadon { get; set; }
        public string Tenkhachhang { get; set; }
        public double Thanhtien { get; set; }
        public DateTime Ngaygiaodich { get; set; }
        public SubHoaDon(){}
        
    }
}