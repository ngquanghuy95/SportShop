using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SportShop.Controllers
{
    public class KidsController : Controller
    {
        // GET: Other
        public ActionResult Index()
        {
            SportShop.DAO.ShoppingCart objCart = (SportShop.DAO.ShoppingCart)Session["Cart"];
            return View();
        }
    }
}