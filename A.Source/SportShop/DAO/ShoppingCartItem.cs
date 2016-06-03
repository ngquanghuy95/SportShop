using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace SportShop.Entities
{
    public class ShoppingCartItem
    {
        public int ProductID { get; set; }
        public string ProductName { get; set; }
        public string Avatar { get; set; }
        public int Quantity { get; set; }
        public float Priece { get; set; }
        public float Total { get; set; }
        public ShoppingCartItem() { }
    }
}