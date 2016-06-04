using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SportShop.Entities;

namespace SportShop.DAO
{
    public class BrandDAO
    {
        MyData myData;
        public BrandDAO()
        {
            myData = new MyData();
        }
        public IQueryable<Brand> ListBrand()
        {
            return (from s in myData.Brands select s);
        }
        public Brand SigleBrand(int ID)
        {
            Brand br=myData.Brands.Find(ID);
            return br;
        }
        public bool InsertBrand(Brand brand)
        {
            var obj = from s in myData.Brands where s.BrandName == brand.BrandName select s;
            if (obj.Count() == 0)
            {
                myData.Brands.Add(brand);
                myData.SaveChanges();
                return true;
            }
            else
            {
                return false;
            }
        }
        public bool UpdateBrand(Brand brand)
        {
            Brand br = myData.Brands.Find(brand.BrandID);
            if (br != null)
            {
                br.BrandName = brand.BrandName;
                myData.SaveChanges();
                return true;
            }
            else { return false; }
        }
        public bool DeleteBrand(int brandID)
        {
            Brand br = myData.Brands.Find(brandID);
            if (br != null)
            {
                myData.Brands.Remove(br);
                myData.SaveChanges();
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}