using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CommunityShed.Models;

namespace CommunityShed
{
    public partial class AddItem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddItem_Click(object sender, EventArgs e)
        {
            string itemName = ItemNameInput.Text;
            string warning = WarningInput.Text;
            string itemUse = CategoryList.SelectedValue;
            int personId = int.Parse(PersonList.SelectedValue);
            int age = int.Parse(RangeList.SelectedValue);

            int? id = DatabaseHelper.Insert(@"
                insert into Item (Name, ToolType, AgeId, Warnings, CommunityPersonId)
                values (@Name, @ToolType, @AgeId, @Warnings, @CommunityPersonId);
            ",
                new SqlParameter("@Name", itemName),
                new SqlParameter("@ToolType", itemUse),
                new SqlParameter("@AgeId", age),
                new SqlParameter("@Warnings", warning),
                new SqlParameter("@CommunityPersonId", personId));
            ;
        }
    }
}