using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_show3 : System.Web.UI.Page
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
        SqlCommand cmd = new SqlCommand("select c.log_id,a.policy_number,a.policy_holder_name,a.phno,a.emailid,a.claim_amount,a.get_amount,c.hash from Log_Table c inner join(select * from amount_paid_by_admin where cust_id=@cust_id)as a on  a.claimpay_id_hash=c.hash and log_id=@log_id", conn);
           cmd.Parameters.AddWithValue("@log_id", Request.QueryString["log_id"]);
        cmd.Parameters.AddWithValue("@cust_id", Session["cust_id"]);
        adp = new SqlDataAdapter(cmd);
        dt = new DataTable();
        adp.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            txtpolicy_number.Text = dt.Rows[0]["policy_number"].ToString();
            txtname.Text = dt.Rows[0]["policy_holder_name"].ToString();
            txtcontact_number.Text = dt.Rows[0]["phno"].ToString();
            txtemailid.Text = dt.Rows[0]["emailid"].ToString();
            txtclaim_amount.Text = dt.Rows[0]["claim_amount"].ToString();
            txt_get_amount.Text = dt.Rows[0]["get_amount"].ToString();
}
    }
}