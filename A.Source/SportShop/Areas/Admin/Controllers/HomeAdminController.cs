using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SportShop.DAO;

namespace SportShop.Areas.Admin.Controllers
{
    public class HomeAdminController : Controller
    {
        // GET: Admin/HomeAdmin
        public ActionResult Index()
        {
            if (Session["Username"] != null)
            {
                return RedirectToAction("Index", "Dashboard");
            }
            else
            {
                return RedirectToAction("Login");
            }
        }
        public ActionResult Login()
        {
            return View();
        }
        public ActionResult CheckLogin(string username, string password)
        {
            UserDAO ad= new UserDAO();
            if(ad.Login(username,password)){
                Session["Username"]=username;
                return Redirect("/Admin/HomeAdmin");
            }
            else{
                return RedirectToAction("Login");
            }
        }
        public ActionResult Logout()
        {
            Session["Username"] = null;
            return RedirectToAction("Login", "HomeAdmin");
        }
    }
}