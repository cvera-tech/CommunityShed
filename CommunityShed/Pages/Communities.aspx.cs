using CommunityShed.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CommunityShed.Pages
{
    public partial class Communities : BasePage
    {
        private const string GetUserCommunitiesQuery = @"
            SELECT C.Id, C.Name, C.Availability
            FROM Community C
                JOIN CommunityPerson CP ON CP.CommunityId = C.Id
                JOIN Person P ON CP.PersonId = P.Id
            WHERE P.Id = @UserId
            GROUP By C.Id, Name, Availability
        ";

        private const string GetCommunityRolesQuery = @"
            SELECT Role
            FROM CommunityPerson CP
                JOIN Community C ON CP.CommunityId = C.Id
                JOIN Person P On CP.PersonId = P.Id
            WHERE P.Id = @UserId
                AND C.Id = @CommunityId
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
                userTable.Columns.Add(new DataColumn("Roles"));
                foreach (DataRow row in userTable.Rows)
                {
                    // Get the roles
                    DataTable rolesTable = DatabaseHelper.Retrieve(GetCommunityRolesQuery,
                        new SqlParameter("@UserId", userId),
                        new SqlParameter("@CommunityId", row.Field<int>("Id")));
                    string rolesString = BuildRolesString(rolesTable);
                    row.SetField<string>("Roles", rolesString);
                }
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

        /// <summary>
        /// Iterates through a roles table and aggregates all roles into a single string.
        /// </summary>
        /// <param name="rolesTable">The DataTable containing a single column of role strings.</param>
        /// <returns>The aggregated string of roles.</returns>
        private string BuildRolesString(DataTable rolesTable)
        {
            StringBuilder rolesBuilder = new StringBuilder(string.Empty);
            foreach(DataRow row in rolesTable.Rows)
            {
                if (string.IsNullOrEmpty(rolesBuilder.ToString()))
                {
                    rolesBuilder.Append(row.Field<string>("Role"));
                }
                else
                {
                    rolesBuilder.Append(", " + row.Field<string>("Role"));
                }
            }

            return rolesBuilder.ToString();
        }
    }
}