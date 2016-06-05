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
        public void Delete(int imgID)
        {
            var img = myData.Images.SingleOrDefault(x => x.ImageID == imgID);
            if(img!=null){
                myData.Images.Remove(img);
                myData.SaveChanges();
            }
            
        }
        public void Create(string linkImg, int prID)
        {
            Image img = new Image { LinkImage = linkImg, ProductID = prID };
            myData.Images.Add(img);
            myData.SaveChanges();
        }
    }
}