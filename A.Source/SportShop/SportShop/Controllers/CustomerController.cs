using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SportShop.DAO;
using SportShop.Entities;

namespace SportShop.Controllers
{
    public class CustomerController : Controller
    {
        // GET: Customer
        public ActionResult Login()
        {
            return View();
        }
        public ActionResult Register()
        {
            return View();
        }

        public ActionResult AddKhachhang(string inpName, string inpEmail, string inpPass, string inpAdress, string inpPhoneNumber)
        {
            Khachhang kh = new Khachhang();
            kh.Tenkhachhang = inpName;
            kh.Email = inpEmail;
            kh.Password = inpPass;
            kh.Diachi = inpAdress;
            kh.Sodienthoai = inpPhoneNumber;
            APIs api = new APIs();
            api.AddCustomer(kh);
            return View("Login");
        }
        public ActionResult CheckLogin(string email, string password)
        {
            APIs api = new APIs();
            if (api.Login(email, password))
            {
                Session["Khachhang"] = api.GetKhachhang(email);
                return Redirect("/Home/Index");
            }
            else
            {
                return RedirectToAction("Login");
            }
        }
        public ActionResult Logout()
        {
            Session["Khachhang"] = null;
            return Redirect("/Home/Index");
        }
    }
}