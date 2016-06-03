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
    public class SalesController : Controller
    {
        private MyData db = new MyData();

        // GET: Admin/Sales
        public ActionResult Index()
        {
            if (Session["Username"] == null)
            {
                return RedirectToAction("Login", "HomeAdmin");
            }
            return View(from s in db.Sales select s);
        }

        // GET: Admin/Sales/Details/5
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
            Sale sale = db.Sales.Find(id);
            if (sale == null)
            {
                return HttpNotFound();
            }
            return View(sale);
        }

        // GET: Admin/Sales/Create
        public ActionResult Create()
        {
            if (Session["Username"] == null)
            {
                return RedirectToAction("Login", "HomeAdmin");
            }
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "SaleID,SaleNum,Date,SaleName")] Sale sale)
        {
            if (Session["Username"] == null)
            {
                return RedirectToAction("Login", "HomeAdmin");
            }
            if (ModelState.IsValid)
            {
                db.Sales.Add(sale);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(sale);
        }

        // GET: Admin/Sales/Edit/5
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
            Sale sale = db.Sales.Find(id);
            if (sale == null)
            {
                return HttpNotFound();
            }
            return View(sale);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "SaleID,SaleNum,Date,SaleName")] Sale sale)
        {
            if (Session["Username"] == null)
            {
                return RedirectToAction("Login", "HomeAdmin");
            }
            if (ModelState.IsValid)
            {
                db.Entry(sale).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(sale);
        }

        // GET: Admin/Sales/Delete/5
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
            Sale sale = db.Sales.Find(id);
            if (sale == null)
            {
                return HttpNotFound();
            }
            return View(sale);
        }

        // POST: Admin/Sales/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            if (Session["Username"] == null)
            {
                return RedirectToAction("Login", "HomeAdmin");
            }
            Sale sale = db.Sales.Find(id);
            db.Sales.Remove(sale);
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
