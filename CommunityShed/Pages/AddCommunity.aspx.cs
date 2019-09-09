using CommunityShed.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CommunityShed.Pages
{
    public partial class AddCommunity : BasePage
    {
        private const string InsertCommunityTransactionQuery = @"
            begin tran;
            INSERT INTO Community 
                (Name, Availability)
            VALUES 
                (@Name, @Availability);

            DECLARE @CommunityId int;
            SET @CommunityId = CAST(SCOPE_IDENTITY() AS int);

            INSERT INTO CommunityPerson (PersonId, CommunityId, RoleId)
            VALUES 
                (@PersonId, @CommunityId, 1),   -- Member
                (@PersonId, @CommunityId, 2),   -- Approver
                (@PersonId, @CommunityId, 3),   -- Reviewer
                (@PersonId, @CommunityId, 4);   -- Enforcer
            
            COMMIT TRAN;
        ";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SubmitButton_Command(object sender, CommandEventArgs e)
        {
            string communityName = NameTextBox.Text;
            bool availability = AvailabilityCheckBox.Checked;
            DatabaseHelper.Update(InsertCommunityTransactionQuery,
                new SqlParameter("@Name", communityName),
                new SqlParameter("@Availability", availability),
                new SqlParameter("@PersonId", userId));
            Response.Redirect("~/Pages/Communities.aspx");
        }
    }
}