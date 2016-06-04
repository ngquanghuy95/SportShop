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
    public class WomanController : Controller
    {
        // GET: Woman
        APIs api = new APIs();
        private MyData db = new MyData();
        public ActionResult Index()
        {
            ViewData["lstP"] = api.getLstProduct(2);
            ViewData["lstNP"] = api.getLstNewProduct(2);
            ViewData["lstSP"] = api.getLstSaleProduct(2);
            ViewData["lstRP"] = api.getLstCommonProduct(2);
            return View();
        }
    }
}