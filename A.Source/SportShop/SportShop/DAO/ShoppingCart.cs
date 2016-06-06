using SportShop.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SportShop.DAO
{
    public class ShoppingCart
    {
        public List<ShoppingCartItem> ListProduct { get; set; }
        public ShoppingCart()
        {
            ListProduct = new List<ShoppingCartItem>();
        }
        public void AddToCart(ShoppingCartItem product)
        {
            int index = ListProduct.FindIndex(x => x.ProductID == product.ProductID);
            if (index != -1)
            {
                ListProduct[index].Quantity += product.Quantity;
                ListProduct[index].Total += product.Total;
            }
            else
            {
                ListProduct.Add(product);
            }
        }
        public void RemoveFromCart(int productID)
        {
            int index = ListProduct.FindIndex(x => x.ProductID == productID);
            if (index != -1)
            {
                if (ListProduct[index].Quantity != 1)
                {
                    ListProduct[index].Quantity -= 1;
                    ListProduct[index].Total -= ListProduct[index].Priece;
                }
                else
                {
                    ListProduct.RemoveAt(index);
                }
            }
        }
        public double GetTotal()
        {
            double result=0;
            foreach (ShoppingCartItem o in ListProduct)
            {
                result += o.Total;
            }
            return result*1000;
        }
        public void EmptyCart()
        {
            ListProduct.Clear();
        }
    }
}