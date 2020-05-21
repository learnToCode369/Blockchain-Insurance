using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_show : System.Web.UI.Page
{
    private string cs = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    SqlConnection conn;
    SqlCommand comm;
    SqlDataAdapter adp;
    DataTable dt = new DataTable();
    public string type;
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(cs);
        SqlCommand cmd = new SqlCommand("select c.log_id,a.cust_name,a.address,a.phno,a.emailId,c.hash from Log_Table c inner join(select * from customer_master where cust_id=@cust_id)as a on  a.cust_id_hash=c.hash and log_id=@log_id", conn);
        cmd.Parameters.AddWithValue("@log_id", Request.QueryString["log_id"]);
        cmd.Parameters.AddWithValue("@cust_id", Session["cust_id"]);
        adp=new SqlDataAdapter(cmd);
        dt=new DataTable();
        adp.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            txtname.Text = dt.Rows[0]["cust_name"].ToString();
            txtaddress.Text = dt.Rows[0]["address"].ToString();
            txtemail.Text = dt.Rows[0]["emailId"].ToString();
            txtnumber.Text = dt.Rows[0]["phno"].ToString();
        }

    }
}