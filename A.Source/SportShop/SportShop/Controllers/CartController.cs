using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SportShop.Entities;
using SportShop.DAO;

namespace SportShop.Controllers
{
    public class CartController : Controller
    {
        // GET: Cart
        APIs api = new APIs();
        public ActionResult Index()
        {
            ShoppingCart objCart = (ShoppingCart)Session["Cart"];
            return View(objCart);
        }
        public ActionResult AddToCart(int id)
        {
            //var reponse = new { Code = 1, Msg = "False", count = 0 };
            Product objProduct = api.getSingleProduct(id);
            ShoppingCart objCart = (ShoppingCart)Session["Cart"];
            if (objProduct != null)
            {
                if (objCart == null)
                {
                    objCart = new ShoppingCart();
                }
                ShoppingCartItem objItem = new ShoppingCartItem();
                objItem.ProductID = objProduct.ProductID;
                objItem.ProductName = objProduct.ProductName;
                objItem.Avatar = objProduct.Avatar;
                objItem.Quantity = 1;
                objItem.Priece = objProduct.Price;
                objItem.Total = objProduct.Price;

                objCart.AddToCart(objItem);
                Session["Cart"] = objCart;  
                //reponse = new { Code = 0, Msg = "Success", count = s };
            }
            return PartialView("TagCart",objCart);
        }
        public JsonResult RemoveFromCart(int id)
        {
            var reponse = new { Code = 1, Msg = "False" };
            ShoppingCart objCart = (ShoppingCart)Session["Cart"];
            if (objCart != null)
            {
                objCart.RemoveFromCart(id);
                Session["Cart"] = objCart;
                reponse = new { Code = 1, Msg = "Success" };
            }
            return Json(reponse);
        }
        public JsonResult RemoveCart()
        {
            var reponse = new { Code = 1, Msg = "False" };
            ShoppingCart objCart = (ShoppingCart)Session["Cart"];
            if (objCart != null)
            {
                objCart.EmptyCart();
                Session["Cart"] = objCart;
                reponse = new { Code = 1, Msg = "Success" };
            }
            return Json(reponse);
        }
    }
}