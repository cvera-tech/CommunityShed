using System;
using CommunityShed.Models;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CommunityShed.Pages
{
    public partial class LoanApplication : System.Web.UI.Page
    {
        int lenderId;
        int borrowerId;
        int itemId;


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

        protected void Page_Load(object sender, EventArgs e)
        {
            itemId = int.Parse(Request.QueryString["ID"]);
            DataTable dt = DatabaseHelper.Retrieve(@"
                    SELECT i.Name, i.Warnings, p.id AS lenderId
                    FROM Item i JOIN CommunityPerson cp ON i.CommunityPersonId = cp.Id
                    JOIN Person p ON cp.PersonId = p.Id
                    where i.id = @ToolId
                ", new SqlParameter("@ToolId", itemId));
            lenderId = dt.Rows[0].Field<int>("lenderId");
            if (dt.Rows.Count == 1)
            {
                ToolNameDisplay.Text = "\tTool Name: "+ dt.Rows[0].Field<string>("Name");
                ToolsWarningDisplay.Text = "\tWarnings: " + dt.Rows[0].Field<string>("Warnings");
            }
        }

        protected void SubmitLoan_Click(object sender, EventArgs e)
        {
            DateTime requestedOndate = DateTime.UtcNow;
            string currentStatus = "Pending";
            int? id = DatabaseHelper.Insert(@"
                insert into LoanApplication (ItemId, RequestedOn, BorrowerId, Status , LenderId)
                values (@ItemId, @RequestedOn, @BorrowerId, @Status, @LenderId);",
               new SqlParameter("@ItemId", itemId),
               new SqlParameter("@RequestedOn", requestedOndate),
               new SqlParameter("@BorrowerId", userId),
               new SqlParameter("@Status", currentStatus),
               new SqlParameter("@LenderId", lenderId));
            ;
        }
    }
}