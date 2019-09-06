using System;
using CommunityShed.Models;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CommunityShed.Pages
{
    public partial class SearchItem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

              

            }

        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            string toolName = ToolNameInput.Text;
            int selectedToolType = int.Parse(CategoryList.SelectedValue);
            int range = int.Parse(RangeList.SelectedValue);
            
            if (toolName.Length>1 && (selectedToolType == -1) && (range==-1))
            {
                DataTable dt = DatabaseHelper.Retrieve(@"
                    SELECT i.[Name], i.CategoriesId, p.FirstName + ' ' + p.LastName AS FullName
                    FROM Item i JOIN CommunityPerson cp ON i.CommunityPersonId = cp.Id
                    JOIN Person p ON cp.PersonId = p.id
                    WHERE i.[Name] = @Name",
                   new System.Data.SqlClient.SqlParameter("@name",toolName));
                ItemsList.DataSource = dt.Rows;
                ItemsList.DataBind();
            }
            else if(selectedToolType != -1)
            {
                DataTable dt = DatabaseHelper.Retrieve(@"
                    SELECT c.[Type], c.Id
                    FROM Item i JOIN Categories c ON i.CategoriesId = c.Id
                    WHERE c.Id = @toolType",
                    new System.Data.SqlClient.SqlParameter("@toolType", selectedToolType));
                ItemsList.DataSource = dt.Rows;
                ItemsList.DataBind();
            }
        }
    }
}