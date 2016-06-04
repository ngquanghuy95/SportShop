using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SportShop.Entities;

namespace SportShop.DAO
{
    public class UserDAO
    {
        MyData db;
        public UserDAO()
        {
            db = new MyData();
        }
        public bool Login(string Username, string Password)
        {
            var result = db.Users.Count(x => x.Account == Username && x.Password == Password);
            if (result > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}