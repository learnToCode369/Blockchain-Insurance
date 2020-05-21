using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_show2 : System.Web.UI.Page
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
        SqlCommand cmd = new SqlCommand("select c.log_id,a.policy_number,a.policy_type,a.policy,a.phno,a.emailId,a.claim_amount,a.end_date,c.hash from Log_Table c inner join(select * from apply_for_claim where cust_id=@cust_id)as a on  a.claim_id_hash=c.hash and log_id=@log_id", conn);
        cmd.Parameters.AddWithValue("@log_id", Request.QueryString["log_id"]);
        cmd.Parameters.AddWithValue("@cust_id", Session["cust_id"]);
        adp = new SqlDataAdapter(cmd);
        dt = new DataTable();
        adp.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            txtpolicynumber.Text = dt.Rows[0]["policy_number"].ToString();
            txtploicytype.Text = dt.Rows[0]["policy_type"].ToString();
            txtpolicy.Text = dt.Rows[0]["policy"].ToString();
            txtcontactnumber.Text = dt.Rows[0]["phno"].ToString();
            txtemail_id.Text = dt.Rows[0]["emailId"].ToString();
            txtcmlaimamount.Text = dt.Rows[0]["claim_amount"].ToString();
            txtend_date.Text = dt.Rows[0]["end_date"].ToString();
        
        }
    }
  
}