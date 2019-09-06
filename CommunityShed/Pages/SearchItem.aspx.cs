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
            
            //If search is conducted using only the search textbox
            if (toolName.Length>1 && (selectedToolType == -1) && (range==-1))
            {
                DataTable dt = DatabaseHelper.Retrieve(@"
                    SELECT i.[Name],c.[Type], c.Id ,i.CategoriesId, p.FirstName + ' ' + p.LastName AS FullName, ag.Age
                    FROM Item i JOIN CommunityPerson cp ON i.CommunityPersonId = cp.Id
                    JOIN Categories c ON i.CategoriesId = c.Id
                    JOIN Person p ON cp.PersonId = p.id
                    JOIN AgeRange ag ON i.AgeId = ag.Id
                    WHERE i.[Name] = @Name",
                   new System.Data.SqlClient.SqlParameter("@name",toolName));
                ItemsList.DataSource = dt.Rows;
                ItemsList.DataBind();
            }
            //If search is conducted using only the tool type drop down list
            else if (selectedToolType != -1 && toolName.Length==0)
            {
                DataTable dt = DatabaseHelper.Retrieve(@"
                    SELECT i.[Name], i.CategoriesId, c.[Type], c.Id,  p.FirstName + ' ' + p.LastNAME AS FullName, ag.Age
                    FROM Item i JOIN Categories c ON i.CategoriesId = c.Id
                    JOIN CommunityPerson cp ON I.CommunityPersonId = cp.Id
                    JOIN Person p ON cp.PersonId = p.id
                    JOIN AgeRange ag ON i.AgeId = ag.Id
                    WHERE c.Id = @toolType",
                    new System.Data.SqlClient.SqlParameter("@toolType", selectedToolType));
                ItemsList.DataSource = dt.Rows;
                ItemsList.DataBind();
            }

            //If search is conducted using only the range drop down list
            else if (range!= -1 && toolName.Length == 0)
            {
                DataTable dt = DatabaseHelper.Retrieve(@"
                    SELECT i.[Name], i.CategoriesId, c.[Type], c.Id,  p.FirstName + ' ' + p.LastNAME AS FullName, ag.Age
                    FROM Item i JOIN Categories c ON i.CategoriesId = c.Id
                    JOIN AgeRange ag ON ag.Id = i.AgeId
                    JOIN CommunityPerson cp ON I.CommunityPersonId = cp.Id
                    JOIN Person p ON cp.PersonId = p.id
                    WHERE ag.Id = @selectedAgeRange",
                    new System.Data.SqlClient.SqlParameter("@selectedAgeRange", range));
                ItemsList.DataSource = dt.Rows;
                ItemsList.DataBind();
            }
            //If search is conducted using only the search textbox and tool type drop down list
            else if (toolName.Length>1 && selectedToolType != -1)
            {
                DataTable dt = DatabaseHelper.Retrieve(@"
                    SELECT i.[Name], i.CategoriesId, c.[Type], c.Id,  p.FirstName + ' ' + p.LastNAME AS FullName, ag.Age
                    FROM Item i JOIN Categories c ON i.CategoriesId = c.Id
                    JOIN AgeRange ag ON ag.Id = i.AgeId
                    JOIN CommunityPerson cp ON I.CommunityPersonId = cp.Id
                    JOIN Person p ON cp.PersonId = p.id
                    WHERE i.[Name] = @Name AND c.Id = @toolType",
                    new System.Data.SqlClient.SqlParameter("@name", toolName),
                    new System.Data.SqlClient.SqlParameter("@toolType", selectedToolType)
                    );
                ItemsList.DataSource = dt.Rows;
                ItemsList.DataBind();
            }
            //If search is conducted using only the tool type drop down list and range drop down list
            else if (toolName.Length > 1 && range!= -1)
            {
                DataTable dt = DatabaseHelper.Retrieve(@"
                    SELECT i.[Name], i.CategoriesId, c.[Type], c.Id,  p.FirstName + ' ' + p.LastNAME AS FullName, ag.Age
                    FROM Item i JOIN Categories c ON i.CategoriesId = c.Id
                    JOIN AgeRange ag ON ag.Id = i.AgeId
                    JOIN CommunityPerson cp ON I.CommunityPersonId = cp.Id
                    JOIN Person p ON cp.PersonId = p.id
                    WHERE i.[Name] = @Name AND WHERE ag.Id = @selectedAgeRange",
                    new System.Data.SqlClient.SqlParameter("@name", toolName),
                    new System.Data.SqlClient.SqlParameter("@selectedAgeRange", range)
                    );
                ItemsList.DataSource = dt.Rows;
                ItemsList.DataBind();
            }
            //If search is conducted using only the search textbox, tool type drop down list and range drop down list
            else if (toolName.Length > 1 && selectedToolType != -1 && range != -1)
            {
                DataTable dt = DatabaseHelper.Retrieve(@"
                    SELECT i.[Name], i.CategoriesId, c.[Type], c.Id,  p.FirstName + ' ' + p.LastNAME AS FullName, ag.Age
                    FROM Item i JOIN Categories c ON i.CategoriesId = c.Id
                    JOIN AgeRange ag ON ag.Id = i.AgeId
                    JOIN CommunityPerson cp ON I.CommunityPersonId = cp.Id
                    JOIN Person p ON cp.PersonId = p.id
                    WHERE i.[Name] = @Name AND WHERE c.Id = @toolType AND WHERE ag.Id = @selectedAgeRange",
                    new System.Data.SqlClient.SqlParameter("@name", toolName),
                    new System.Data.SqlClient.SqlParameter("@toolType", selectedToolType),
                    new System.Data.SqlClient.SqlParameter("@selectedAgeRange", range)
                    );
                ItemsList.DataSource = dt.Rows;
                ItemsList.DataBind();
            }
        }
    }
}