using CommunityShed.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CommunityShed.Pages
{
    public partial class AddPerson : System.Web.UI.Page
    {
        private const string HomeUrl = "~/";
        private const string InsertPersonQuery = @"
            INSERT INTO Person (Username, HashedPassword, FirstName, LastName) 
            VALUES (@Username, @HashedPassword, @FirstName, @LastName)
        ";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SubmitButton_Command(object sender, CommandEventArgs e)
        {
            string username = UsernameTextBox.Text;
            string password = PasswordTextBox.Text;
            string firstName = FirstNameTextBox.Text;
            string lastName = LastNameTextBox.Text;

            DatabaseHelper.Insert(InsertPersonQuery,
                new SqlParameter("@Username", username),
                new SqlParameter("@HashedPassword", password),
                new SqlParameter("@FirstName", firstName),
                new SqlParameter("@LastName", username));

            Response.Redirect(HomeUrl);
        }

        protected void CancelButton_Command(object sender, CommandEventArgs e)
        {
            Response.Redirect(HomeUrl);
        }
    }
}