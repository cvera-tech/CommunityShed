using CommunityShed.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CommunityShed
{
    public partial class Login : System.Web.UI.Page
    {
        private const string GetUserQuery = @"
            SELECT
                Id,
                Username,
                HashedPassword
            FROM Person
            WHERE Username = @Username
        ";

        protected void SubmitButton_Command(object sender, CommandEventArgs e)
        {
            string username = UsernameTextBox.Text;
            string password = PasswordTextBox.Text;

            DataTable userTable = DatabaseHelper.Retrieve(GetUserQuery,
                new SqlParameter("@Username", username));
            if (userTable.Rows.Count == 1)
            {
                DataRow userRow = userTable.Rows[0];
                string hashedPassword = userRow.Field<string>("HashedPassword");
                //if (BCrypt.Net.BCrypt.Verify(password, hashedPassword))
                //{
                //    FormsAuthentication.RedirectFromLoginPage(username, false);
                //}

                if (hashedPassword.Equals(password))
                {
                    FormsAuthentication.RedirectFromLoginPage(username, false);
                }
            }
            else
            {
                BadLoginMessage.Visible = true;
            }
        }
    }
}