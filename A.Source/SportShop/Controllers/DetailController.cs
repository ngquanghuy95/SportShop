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
    public class DetailController : Controller
    {
        APIs api = new APIs();
        private MyData db = new MyData();
        // GET: Detail
        public ActionResult Index(int id)
        {
            ShoppingCart objCart = (ShoppingCart)Session["Cart"];
            ViewData["Product"] = api.getSingleProduct(id);
            ViewData["Category"] = api.getLstCategory();
            ViewData["Brand"] = api.getLstBrand();
            ViewData["Color"] = api.getLstColor();
            ViewData["Size"] = api.getLstSize();
            ViewData["Type"] = api.getLstType();
            ViewData["lstRP"] = api.getLstCommonProduct();
            Product product = db.Products.Find(id);
            product.Rating += 1;
            db.Entry(product).State = EntityState.Modified;
            db.SaveChanges();
            return View();
        }
    }
}