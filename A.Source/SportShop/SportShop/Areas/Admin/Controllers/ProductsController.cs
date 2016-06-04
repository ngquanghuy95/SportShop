using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using SportShop.Entities;

namespace SportShop.Areas.Admin.Controllers
{
    public class ProductsController : Controller
    {

        private MyData db = new MyData();

        // GET: Admin/Products
        public ActionResult Index()
        {
            if (Session["Username"] == null)
            {
                return RedirectToAction("Login", "HomeAdmin");
            }
            var products = db.Products.Include(p => p.Brand).Include(p => p.Category).Include(p => p.Color).Include(p => p.Sale).Include(p => p.ShoeType).Include(p => p.Size);
            return View(products.ToList());
        }

        // GET: Admin/Products/Details/5
        public ActionResult Details(int? id)
        {
            if (Session["Username"] == null)
            {
                return RedirectToAction("Login", "HomeAdmin");
            }
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // GET: Admin/Products/Create
        public ActionResult Create()
        {
            if (Session["Username"] == null)
            {
                return RedirectToAction("Login", "HomeAdmin");
            }
            ViewBag.BrandID = new SelectList(db.Brands, "BrandID", "BrandName");
            ViewBag.CategoryID = new SelectList(db.Categories, "CategoryID", "CategoryName");
            ViewBag.ColorID = new SelectList(db.Colors, "ColorID", "ColorName");
            ViewBag.SaleID = new SelectList(db.Sales, "SaleID", "SaleName");
            ViewBag.TypeID = new SelectList(db.ShoeTypes, "TypeID", "TypeName");
            ViewBag.SizeID = new SelectList(db.Sizes, "SizeID", "SizeNum");
            return View();
        }

        // POST: Admin/Products/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ProductID,ProductName,TypeID,CategoryID,BrandID,ColorID,SaleID,SizeID,Price,Description,IsNew,Avatar")] Product product)
        {
            if (Session["Username"] == null)
            {
                return RedirectToAction("Login", "HomeAdmin");
            }
            if (ModelState.IsValid)
            {
                db.Products.Add(product);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.BrandID = new SelectList(db.Brands, "BrandID", "BrandName", product.BrandID);
            ViewBag.CategoryID = new SelectList(db.Categories, "CategoryID", "CategoryName", product.CategoryID);
            ViewBag.ColorID = new SelectList(db.Colors, "ColorID", "ColorName", product.ColorID);
            ViewBag.SaleID = new SelectList(db.Sales, "SaleID", "SaleName", product.SaleID);
            ViewBag.TypeID = new SelectList(db.ShoeTypes, "TypeID", "TypeName", product.TypeID);
            ViewBag.SizeID = new SelectList(db.Sizes, "SizeID", "SizeNum", product.SizeID);
            return View(product);
        }

        // GET: Admin/Products/Edit/5
        public ActionResult Edit(int? id)
        {
            if (Session["Username"] == null)
            {
                return RedirectToAction("Login", "HomeAdmin");
            }
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            ViewBag.BrandID = new SelectList(db.Brands, "BrandID", "BrandName", product.BrandID);
            ViewBag.CategoryID = new SelectList(db.Categories, "CategoryID", "CategoryName", product.CategoryID);
            ViewBag.ColorID = new SelectList(db.Colors, "ColorID", "ColorName", product.ColorID);
            ViewBag.SaleID = new SelectList(db.Sales, "SaleID", "SaleName", product.SaleID);
            ViewBag.TypeID = new SelectList(db.ShoeTypes, "TypeID", "TypeName", product.TypeID);
            ViewBag.SizeID = new SelectList(db.Sizes, "SizeID", "SizeNum", product.SizeID);
            return View(product);
        }

        // POST: Admin/Products/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ProductID,ProductName,TypeID,CategoryID,BrandID,ColorID,SaleID,SizeID,Price,Description,IsNew,Avatar")] Product product)
        {
            if (Session["Username"] == null)
            {
                return RedirectToAction("Login", "HomeAdmin");
            }
            if (ModelState.IsValid)
            {
                db.Entry(product).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.BrandID = new SelectList(db.Brands, "BrandID", "BrandName", product.BrandID);
            ViewBag.CategoryID = new SelectList(db.Categories, "CategoryID", "CategoryName", product.CategoryID);
            ViewBag.ColorID = new SelectList(db.Colors, "ColorID", "ColorName", product.ColorID);
            ViewBag.SaleID = new SelectList(db.Sales, "SaleID", "SaleName", product.SaleID);
            ViewBag.TypeID = new SelectList(db.ShoeTypes, "TypeID", "TypeName", product.TypeID);
            ViewBag.SizeID = new SelectList(db.Sizes, "SizeID", "SizeNum", product.SizeID);
            return View(product);
        }

        // GET: Admin/Products/Delete/5
        public ActionResult Delete(int? id)
        {
            if (Session["Username"] == null)
            {
                return RedirectToAction("Login", "HomeAdmin");
            }
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // POST: Admin/Products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            if (Session["Username"] == null)
            {
                return RedirectToAction("Login", "HomeAdmin");
            }
            Product product = db.Products.Find(id);
            db.Products.Remove(product);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
