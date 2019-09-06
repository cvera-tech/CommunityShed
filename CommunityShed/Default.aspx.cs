using System;
using CommunityShed.Models;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CommunityShed
{
    public partial class Default : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = DatabaseHelper.Retrieve(@"
                    SELECT p.FirstName + ' ' + p.LastName AS FullName, i.Name AS itemName, lp.RequestedOn AS reqDate, i.Id AS itemId, lp.Duration + ' Days' as DurationTime
                    FROM LoanApplication lp JOIN Item i ON i.id = lp.Itemid
                    JOIN CommunityPerson cp ON i.CommunityPersonId = cp.Id
                    JOIN Person p ON cp.PersonId = p.id");
            ItemsList.DataSource = dt.Rows;
            ItemsList.DataBind();
        }

        protected void LoansButton_Command(object sender, CommandEventArgs e)
        {

        }

        protected void CommunitiesButton_Command(object sender, CommandEventArgs e)
        {

        }

        protected void ItemsButton_Command(object sender, CommandEventArgs e)
        {

        }
    }
}