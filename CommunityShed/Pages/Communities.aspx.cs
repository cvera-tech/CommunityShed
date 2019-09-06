using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CommunityShed.Pages
{
    public partial class Communities : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set user communities visible initially
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

        private void SwitchCommunities()
        {
            UserCommunitiesPanel.Visible = !UserCommunitiesPanel.Visible;
            UserCommunitiesButton.Visible = !UserCommunitiesButton.Visible;
            AllCommunitiesPanel.Visible = !AllCommunitiesPanel.Visible;
            AllCommunitiesButton.Visible = !AllCommunitiesButton.Visible;
        }
    }
}