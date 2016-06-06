using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SportShop.Entities;

namespace SportShop.DAO
{
    public class APIs
    {
        MyData myData;
        public APIs()
        {
            myData = new MyData();
        }
        public IQueryable<Category> getLstCategory()
        {
            return from s in myData.Categories select s;
        }
        public IQueryable<Brand> getLstBrand()
        {
            return from s in myData.Brands select s;
        }
        public IQueryable<Color> getLstColor()
        {
            return from s in myData.Colors select s;
        }
        public IQueryable<Size> getLstSize()
        {
            return from s in myData.Sizes select s;
        }
        public IQueryable<ShoeType> getLstType()
        {
            return from s in myData.ShoeTypes select s;
        }
        public IQueryable<Product> getLstProduct()
        {
            return from s in myData.Products select s;
        }
        public IQueryable<Product> getLstNewProduct()
        {
            return from s in myData.Products where s.IsNew==true select s;
        }
        public IQueryable<Product> getLstCommonProduct()
        {
            return (from s in myData.Products orderby s.Rating descending select s).Take(6);
        }
        public IQueryable<Product> getLstSaleProduct()
        {
            return from s in myData.Products
                   join sale in myData.Sales on s.SaleID equals sale.SaleID 
                   where sale.SaleNum>0 
                   select s;
        }
        public Product getSingleProduct(int productID)
        {
            return myData.Products.Find(productID);
        }
        public IQueryable<Image> getLstImage(int productID)
        {
            return from s in myData.Images where s.ProductID == productID select s;
        }

        //Get list product by Category
        public IQueryable<Product> getLstProduct(int categoryID)
        {
            return from s in myData.Products where s.CategoryID==categoryID select s;
        }
        public IQueryable<Product> getLstNewProduct(int categoryID)
        {
            return from s in myData.Products where s.IsNew == true && s.CategoryID==categoryID select s;
        }
        public IQueryable<Product> getLstCommonProduct(int categoryID)
        {
            return (from s in myData.Products where s.CategoryID == categoryID orderby s.Rating descending select s).Take(6);
        }
        public IQueryable<Product> getLstSaleProduct(int categoryID)
        {
            return from s in myData.Products
                   join sale in myData.Sales on s.SaleID equals sale.SaleID
                   where sale.SaleNum > 0 && s.CategoryID == categoryID
                   select s;
        }
        public void AddCustomer(Khachhang kh)
        {
            myData.Khachhangs.Add(kh);
            myData.SaveChanges();
        }
        public bool Login(string Username, string Password)
        {
            var result = myData.Khachhangs.Count(x => x.Email == Username && x.Password == Password);
            if (result > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public Khachhang GetKhachhang(string Email)
        {
            return (myData.Khachhangs.Single(x => x.Email.Equals(Email)));
        }
        public int AddHoadon(Hoadon hd)
        {
            myData.Hoadons.Add(hd);
            myData.SaveChanges();
            return hd.HoadonID;
        }
        public void AddCTHoadon(List<ShoppingCartItem> lstSC,int HoadonID)
        {
            foreach(ShoppingCartItem item in lstSC){
                Chitiethoadon ct = new Chitiethoadon(){HoadonID = HoadonID
                                                        ,ProductID = item.ProductID
                                                        ,Soluong = item.Quantity
                                                        ,Giagoc = item.Priece
                                                        ,Giadaban = item.Priece};
                myData.Chitiethoadons.Add(ct);
                myData.SaveChanges();
            }

        }
    }
}