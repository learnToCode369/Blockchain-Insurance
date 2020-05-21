using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_show1 : System.Web.UI.Page
{
    private string cs = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    SqlConnection conn;
    SqlCommand comm;
    SqlDataAdapter adp;
    DataTable dt = new DataTable();
    public string type;
    public string log_id;
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(cs);
        log_id = Request.QueryString["log_id"];
        SqlCommand cmd = new SqlCommand("select c.log_id,a.policy_number,a.policy_type,a.policy,a.purchase_date,a.name,a.age,a.phno,a.premium_amount,a.start_date,a.end_date,c.hash from Log_Table c inner join(select * from new_policy where cust_id=@cust_id)as a on  a.policy_id_hash=c.hash and log_id=@log_id", conn);
        cmd.Parameters.AddWithValue("@log_id", Request.QueryString["log_id"]);
        cmd.Parameters.AddWithValue("@cust_id", Session["cust_id"]);
        adp = new SqlDataAdapter(cmd);
        dt = new DataTable();
        adp.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            txtname.Text = dt.Rows[0]["name"].ToString();
            txtage.Text = dt.Rows[0]["age"].ToString();
            txtpolicytype.Text = dt.Rows[0]["policy_type"].ToString();
            txtpolicy.Text = dt.Rows[0]["policy"].ToString();
            txtpre.Text = dt.Rows[0]["premium_amount"].ToString();
            txtstart.Text = dt.Rows[0]["start_date"].ToString();
            txtenddate.Text = dt.Rows[0]["end_date"].ToString();
            txt_p_date.Text = dt.Rows[0]["purchase_date"].ToString();
            txt_con.Text = dt.Rows[0]["phno"].ToString();
        }

    }
}