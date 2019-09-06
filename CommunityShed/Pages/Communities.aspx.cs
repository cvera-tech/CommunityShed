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
    public partial class Communities : BasePage
    {
        // 
        private const string GetUserCommunitiesQuery = @"
            SELECT C.Id, C.Name, C.Availability, CP.Role
            FROM Community C
                JOIN CommunityPerson CP ON CP.CommunityId = C.Id
                JOIN Person P ON CP.PersonId = P.Id
            WHERE P.Id = @UserId
        ";

        // This can become very expensive. Should prune if possible.
        private const string GetAllCommunitiesQuery = @"
            SELECT Id, Name, Availability
            FROM Community
        ";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve user's communities
                int? id = userId;
                DataTable userTable = DatabaseHelper.Retrieve(GetUserCommunitiesQuery,
                    new SqlParameter("@UserId", userId));
                UserCommunitiesRepeater.DataSource = userTable.Rows;
                UserCommunitiesRepeater.DataBind();

                // Retrieve all communities
                DataTable allTable = DatabaseHelper.Retrieve(GetAllCommunitiesQuery);
                AllCommunitiesRepeater.DataSource = allTable.Rows;
                AllCommunitiesRepeater.DataBind();

                // Set user's communities visible
                UserCommunitiesPanel.Visible = true;
                UserCommunitiesButton.Visible = false;
                AllCommunitiesPanel.Visible = false;
                AllCommunitiesButton.Visible = true;
            }
        }

        protected void UserCommunitiesButton_Command(object sender, CommandEventArgs e)
        {
            SwitchCommunities();
        }

        protected void AllCommunitiesButton_Command(object sender, CommandEventArgs e)
        {
            SwitchCommunities();
        }

        /// <summary>
        /// This function switches the lists of communities that the user is presented.
        /// </summary>
        private void SwitchCommunities()
        {
            UserCommunitiesPanel.Visible = !UserCommunitiesPanel.Visible;
            UserCommunitiesButton.Visible = !UserCommunitiesButton.Visible;
            AllCommunitiesPanel.Visible = !AllCommunitiesPanel.Visible;
            AllCommunitiesButton.Visible = !AllCommunitiesButton.Visible;
        }
    }
}