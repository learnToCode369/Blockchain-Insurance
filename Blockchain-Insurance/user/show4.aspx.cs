using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_show4 : System.Web.UI.Page
{
    private string cs = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    SqlConnection conn;
    SqlCommand comm;
    SqlDataAdapter adp;
    DataTable dt = new DataTable();
    public string type;
    public string log_id;
    protected void Page_Load(object sender, EventArgs e)
    { SqlConnection conn=new SqlConnection(cs);
        log_id = Request.QueryString["log_id"];
        SqlCommand cmd=new SqlCommand("select * from Log_Table where log_id=@log_id",conn);
        cmd.Parameters.AddWithValue("@log_id",log_id);
        adp=new SqlDataAdapter(cmd);
        dt=new DataTable();
        adp.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            type = dt.Rows[0]["Type"].ToString();
        }
        if (type == "Registration")
        {
            Response.Redirect("show.aspx?log_id="+log_id);
        }
        else if (type == "New Policy")
        {
            Response.Redirect("show1.aspx?log_id="+log_id);
        }
        else if (type == "Apply For Claim")
        {
            Response.Redirect("show2.aspx?log_id="+log_id);
        }
        else if (type == "Claim By Admin")
        {
            Response.Redirect("show3.aspx?log_id="+log_id);
        }
    }
}