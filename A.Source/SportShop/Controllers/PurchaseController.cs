using SportShop.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SportShop.Controllers
{
    public class PurchaseController : Controller
    {
        // GET: Purchase
        public ActionResult Index()
        {
            ShoppingCart objCart = (ShoppingCart)Session["Cart"];
            return View();
        }
    }
}