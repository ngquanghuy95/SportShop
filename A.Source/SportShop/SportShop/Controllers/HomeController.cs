using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SportShop.DAO;
using SportShop.Entities;
using System.Data.Entity;

namespace SportShop.Controllers
{
    public class HomeController : Controller
    {
        APIs api = new APIs();
        private MyData db = new MyData();
        public ActionResult Index()
        {
            ViewData["lstP"] = api.getLstProduct();
            ViewData["lstNP"] = api.getLstNewProduct();
            ViewData["lstSP"] = api.getLstSaleProduct();
            ViewData["lstRP"] = api.getLstCommonProduct();
            return View();
        }
    }
}