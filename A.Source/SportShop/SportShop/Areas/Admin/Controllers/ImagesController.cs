using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SportShop.Entities;
using SportShop.DAO;

namespace SportShop.Areas.Admin.Controllers
{
    public class ImagesController : Controller
    {
        // GET: Admin/Images
        ImageDAO imgDAO = new ImageDAO();
        public ActionResult Index()
        {
            ViewData["lstProduct"] = imgDAO.LstProduct();
            return View();
        }
        public ActionResult ChooseProduct(int ID)
        {
            IQueryable<Image> lstImages = imgDAO.LstImages(ID);
            return PartialView("_Grid",lstImages);
        }
    }
}