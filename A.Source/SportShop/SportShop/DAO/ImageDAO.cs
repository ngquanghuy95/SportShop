using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SportShop.Entities;

namespace SportShop.DAO
{
    public class ImageDAO
    {
        MyData myData;
        public ImageDAO()
        {
            myData = new MyData();
        }
        public IQueryable<Product> LstProduct()
        {
            return (from s in myData.Products select s);
        }
        public IQueryable<Image> LstImages(int ProductID)
        {
            return (from s in myData.Images
                    where s.ProductID == ProductID
                    select s);
        }
    }
}