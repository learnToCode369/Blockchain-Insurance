using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Windows;
public partial class admin_view_claim : System.Web.UI.Page
{
    private string cs = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    SqlConnection conn;
    //SqlCommand comm;
    SqlDataAdapter adp;
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        conn = new SqlConnection(cs);
        if (!IsPostBack)
        {
            using (SqlCommand cmd = new SqlCommand("select cust_id,policy_number,policy_type,policy,emailId,claim_amount from apply_for_claim", conn))
            {
                DataTable dt = new DataTable();
                using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
                {
                    adp.Fill(dt);
                }
                GridView2.DataSource = dt;
                GridView2.DataBind();
            }
        }
    }


   protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
   {
       //if (e.CommandName == "Accept_")
       //{
       //    Response.Redirect("~/admin/accept.aspx");
       //}
       //if (e.CommandName == "Reject_")
       //{
       //    Response.Redirect("~/admin/accept.aspx");
       //}
   }
}