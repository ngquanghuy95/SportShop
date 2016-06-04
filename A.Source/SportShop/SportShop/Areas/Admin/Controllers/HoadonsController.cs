using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using SportShop.Entities;
using SportShop.Areas.Admin.Models;

namespace SportShop.Areas.Admin.Controllers
{
    public class HoadonsController : Controller
    {
        private MyData db = new MyData();

        // GET: Admin/Hoadons
        public ActionResult Index()
        {
            if (Session["Username"] == null)
            {
                return RedirectToAction("Login", "HomeAdmin");
            }
            var hoadons = db.Hoadons.Include(h => h.Khachhang);
            var result = (from ct in db.Chitiethoadons
                          group ct by ct.HoadonID into CtGroup
                          join hd in db.Hoadons on CtGroup.Key equals hd.HoadonID
                          select new
                          {
                              Mahoadon = hd.HoadonID,
                              Tenkhachhang = hd.Khachhang.Tenkhachhang,
                              Thanhtien = CtGroup.Sum(o=>o.Soluong*o.Giadaban),
                              Ngaygiaodich = hd.Ngaythang,
                          }).Distinct();
            List<SubHoaDon> lst = new List<SubHoaDon>();
            foreach (var s in result)
            {
                SubHoaDon shd = new SubHoaDon();
                shd.Mahoadon = s.Mahoadon;
                shd.Tenkhachhang = s.Tenkhachhang;
                shd.Thanhtien = s.Thanhtien;
                shd.Ngaygiaodich = s.Ngaygiaodich;
                lst.Add(shd);
            }
            return View(lst);
        }

        // GET: Admin/Hoadons/Details/5
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
            Hoadon hoadon = db.Hoadons.Find(id);
            if (hoadon == null)
            {
                return HttpNotFound();
            }
            var cthd = from s in db.Chitiethoadons
                       where s.HoadonID == id
                       select s;
            double thanhtien = cthd.Sum(o => o.Giadaban * o.Soluong);
            ViewData["cthd"] = cthd;
            ViewData["thanhtien"] = thanhtien;
            return View(hoadon);
        }

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
            Hoadon hoadon = db.Hoadons.Find(id);
            if (hoadon == null)
            {
                return HttpNotFound();
            }
            var cthd = from s in db.Chitiethoadons
                       where s.HoadonID == id
                       select s;
            double thanhtien = cthd.Sum(o => o.Giadaban * o.Soluong);
            ViewData["cthd"] = cthd;
            ViewData["thanhtien"] = thanhtien;
            return View(hoadon);
        }

        // POST: Admin/Hoadons/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            if (Session["Username"] == null)
            {
                return RedirectToAction("Login", "HomeAdmin");
            }
            Hoadon hoadon = db.Hoadons.Find(id);
            db.Hoadons.Remove(hoadon);
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
