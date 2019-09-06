using CommunityShed.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace CommunityShed
{
    public class BasePage : Page
    {
        private const string GetUserQuery = @"
            SELECT Id
            FROM Person
            WHERE Username = @Username
        ";

        protected int? userId;

        protected void Page_Init(object sender, EventArgs e)
        {
            string username = User.Identity.Name;
            DataTable userTable = DatabaseHelper.Retrieve(GetUserQuery,
                new SqlParameter("@Username", username));
            userId = userTable.Rows[0].Field<int>("Id");
        }
    }
}