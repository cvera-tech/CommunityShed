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
        private const string GetCommunitiesQuery = @"
            SELECT C.Id
            FROM Community C
                JOIN CommunityPerson CP ON CP.CommunityId = C.Id
                JOIN Person P ON CP.PersonId = P.Id
            WHERE P.Id = @PersonId
        ";

        protected int? userId;

        protected int CurrentCommunityId
        {
            get
            {
                object o = Session["CommunityId"];
                if (o != null)
                {
                    return (int)o;
                }
                else
                {
                    return -1;
                }
            }
            set
            {
                Session["CommunityId"] = value;
            }
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            string username = User.Identity.Name;
            DataTable userTable = DatabaseHelper.Retrieve(GetUserQuery,
                new SqlParameter("@Username", username));
            userId = userTable.Rows[0].Field<int>("Id");
            
            // No community in session
            if (CurrentCommunityId < 0)
            {
                DataTable communitiesTable = DatabaseHelper.Retrieve(GetCommunitiesQuery,
                    new SqlParameter("@PersonId", userId));
                if (communitiesTable.Rows.Count > 0)
                {
                    CurrentCommunityId = communitiesTable.Rows[0].Field<int>("Id");
                }
            }
        }
    }
}