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
        public ActionResult Index(int brand)
        {
            ShoppingCart objCart = (ShoppingCart)Session["Cart"];
            IQueryable<Product> lstProduct = from s in db.Products where s.CategoryID == 3 select s;
            if (brand != 0)
            {
                lstProduct = from s in db.Products where s.CategoryID == 3 && s.BrandID == brand select s;
            }
            ViewData["Product"] = lstProduct;
            ViewData["Brand"] = api.getLstBrand();
            ViewData["Color"] = api.getLstColor();
            ViewData["Type"] = api.getLstType();
            return View();
        }
        public ActionResult Filter(int BrandID, int TypeShoesID, int ColorID)
        {
            IQueryable<Product> lstProduct = from s in db.Products where s.CategoryID == 3  select s;
            if (BrandID != 1)
            {
                lstProduct = from s in lstProduct where s.BrandID == BrandID select s;
            }
            if (TypeShoesID != 1)
            {
                lstProduct = from s in lstProduct where s.TypeID == TypeShoesID select s;
            }
            if (ColorID != 1)
            {
                lstProduct = from s in lstProduct where s.ColorID == ColorID select s;
            }
            return PartialView("ListProduct",lstProduct);
        }
    }
}