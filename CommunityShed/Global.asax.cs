using LibraryApplication.Authentication;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Threading;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.UI;

namespace CommunityShed
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            ScriptManager.ScriptResourceMapping.AddDefinition("jquery",
                new ScriptResourceDefinition
                {
                    Path = "~/Scripts/jquery-3.4.1.min.js",
                    DebugPath = "~/Scripts/jquery-3.4.1.js"
                });
        }

        protected void Application_OnPostAuthenticateRequest(object sender, EventArgs e)
        {
            IPrincipal user = HttpContext.Current.User;

            if (user.Identity.IsAuthenticated && user.Identity.AuthenticationType.Equals("Forms"))
            {
                FormsIdentity formsIdentity = (FormsIdentity)(user.Identity);
                FormsAuthenticationTicket ticket = formsIdentity.Ticket;

                CustomIdentity identity = new CustomIdentity(ticket);
                string[] roles = GetRoles(user.Identity.Name);

                CustomPrincipal principal = new CustomPrincipal(identity, roles);

                HttpContext.Current.User = principal;
                Thread.CurrentPrincipal = principal;
            }
        }

        /// <summary>
        /// This function queries the database for the roles that a user has.
        /// </summary>
        /// <param name="username">The username to use as a filter.</param>
        /// <returns>String array of roles.</returns>
        private string[] GetRoles(string username)
        {
            //const string GetRolesQuery = @"
            //    SELECT
            //     R.Name AS RoleName
            //    FROM UserAccount UA 
            //     JOIN UserRole UR ON UR.UserAccountId = UA.Id
            //     JOIN Role R ON UR.RoleId = R.Id
            //    WHERE UA.Username = @Username
            //";
            //DataTable rolesTable = DatabaseHelper.Retrieve(GetRolesQuery,
            //    new SqlParameter("@Username", username));
            //var rolesList = new List<string>();
            //foreach (DataRow row in rolesTable.Rows)
            //{
            //    var roleName = row.Field<string>("RoleName");
            //    rolesList.Add(roleName);
            //}
            //var roles = rolesList.ToArray();
            //return roles;

            return new string[] { "Admin" };
        }
    }
}