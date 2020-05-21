using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class faculty_view_history : System.Web.UI.Page
{
    private string cs = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    SqlConnection conn;
    SqlCommand comm;
    SqlDataAdapter adp;
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        conn = new SqlConnection(cs);
        string abc = Session["cust_id"].ToString();
        using (SqlCommand cmd = new SqlCommand("select policy_number, name, policy_type,policy, start_date, end_date from new_policy where cust_id='"+abc+"'", conn))
        {
            //cmd.Parameters.AddWithValue("@id", Session["cust_id"]);
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