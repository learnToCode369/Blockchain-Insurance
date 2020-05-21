using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.ServiceModel.Channels;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

public partial class faculty_apply_for_claim : System.Web.UI.Page
{
    private string cs = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    SqlConnection conn;
    public int id, h_id;
    public int cust_id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
        string abcd = Session["cust_id"].ToString();
        SqlDataReader myReader = null;
        conn = new SqlConnection(cs);
        conn.Open();
        //string abcd = Session["cust_id"].ToString();
        SqlCommand cmd1 = new SqlCommand("select policy_number from new_policy where cust_id='" + abcd + "' ", conn);
        SqlDataAdapter da = new SqlDataAdapter(cmd1);
        DataSet ds = new DataSet();
        da.Fill(ds); // fill dataset
        DropDownList1.DataTextField = ds.Tables[0].Columns["policy_number"].ToString();
            // text field name of table dispalyed in dropdown
        DropDownList1.DataValueField = ds.Tables[0].Columns["policy_number"].ToString();
            // to retrive specific  textfield name 
        DropDownList1.DataSource = ds.Tables[0]; //assigning datasource to the dropdownlist
        DropDownList1.DataBind(); //binding dropdownlist
        DropDownList1.Items.Insert(0, new ListItem("--select policy_number--", "0"));
        conn.Close();
        //conn.Open();
        //SqlCommand cmd3 = new SqlCommand("select distinct(policy_type)from new_policy where cust_id='" + abcd + "' ",
        //    conn);
        //SqlDataAdapter da1 = new SqlDataAdapter(cmd3);
        //DataSet ds1 = new DataSet();
        //da1.Fill(ds1); // fill dataset
        //DropDownList2.DataTextField = ds1.Tables[0].Columns["policy_type"].ToString();
        //    // text field name of table dispalyed in dropdown
        //DropDownList2.DataValueField = ds1.Tables[0].Columns["policy_type"].ToString();
        //    // to retrive specific  textfield name 
        //DropDownList2.DataSource = ds1.Tables[0]; //assigning datasource to the dropdownlist
        //DropDownList2.DataBind(); //binding dropdownlist
        //DropDownList2.Items.Insert(0, new ListItem("--select policy_type--", "0"));
        //conn.Close();
        //SqlCommand cmd4 = new SqlCommand("select distinct(policy) from new_policy where cust_id='" + abcd + "' ", conn);
        //SqlDataAdapter da2 = new SqlDataAdapter(cmd4);
        //DataSet ds2 = new DataSet();
        //da2.Fill(ds2); // fill dataset
        //conn.Open();
        //DropDownList3.DataTextField = ds2.Tables[0].Columns["policy"].ToString();
        //DropDownList3.DataValueField = ds2.Tables[0].Columns["policy"].ToString();
        //DropDownList3.DataSource = ds2.Tables[0];
        //DropDownList3.DataBind();
        //DropDownList3.Items.Insert(0, new ListItem("--select policy--", "0"));
        //conn.Close();
        conn.Open();
        //SqlDataReader myReader1 = null;

        SqlCommand cmd2 = new SqlCommand("select phno,emailId from customer_master where cust_id='" + abcd + "' ", conn);
        myReader = cmd2.ExecuteReader();
        while (myReader.Read())
        {
            TextBox1.Text = (myReader["phno"]).ToString();
            TextBox2.Text = (myReader["emailId"]).ToString();
        }
        conn.Close();
        // Calendar1.StartDate = DateTime.Now;
    }
}
    //protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    //{
    //    TextBox4.Text = Calendar1.SelectedDate.ToShortDateString();
    //}

    protected void apply_for_claim_Click(object sender, EventArgs e)
    {
        conn = new SqlConnection(cs);

        SqlCommand cmd2 = new SqlCommand("select policy_number from apply_for_claim  where cust_id=@cust_id", conn);
        cmd2.Parameters.AddWithValue("@cust_id", Session["cust_id"]);
        SqlDataAdapter sda2 = new SqlDataAdapter(cmd2);
        DataTable dt3 = new DataTable();
        sda2.Fill(dt3);
        if (dt3.Rows.Count > 0)
        {
            id = Convert.ToInt32(dt3.Rows[0]["policy_number"]);
        }
       // h_id = id + 1;
        conn.Open();
        SqlCommand cmd1 = new SqlCommand("select * from apply_for_claim where policy_number=@policy_number", conn);
         DataTable dt = new DataTable();
        //SqlCommand cmd1 = new SqlCommand("select * from Patient where patient_email_id=@no", con);

         cmd1.Parameters.AddWithValue("@policy_number", DropDownList1.SelectedValue);
        SqlDataAdapter sda = new SqlDataAdapter(cmd1);
        sda.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            Response.Write("<script>alert(' already Applied')</script>");
        }
        else
        {
            SqlCommand cmd = new SqlCommand("insert into apply_for_claim(cust_id,policy_number,policy_type,policy,phno,emailId,claim_amount,end_date,claim_id_hash) values(@cust_id,@policy_number,@policy_type,@policy,@phno,@emailId,@claim_amount,@end_date,@claim_id_hash)", conn);
            {
                string plainData = Convert.ToString(id);
                string hashedData = ComputeSha256Hash(plainData);
                cmd.Parameters.AddWithValue("@cust_id", Session["cust_id"]);
                cmd.Parameters.AddWithValue("@policy_number", DropDownList1.SelectedValue);
                cmd.Parameters.AddWithValue("@policy_type", DropDownList2.SelectedValue);
                cmd.Parameters.AddWithValue("@policy", DropDownList3.SelectedValue);
                cmd.Parameters.AddWithValue("@phno", TextBox1.Text);
                cmd.Parameters.AddWithValue("@emailId", TextBox2.Text);
                cmd.Parameters.AddWithValue("@claim_amount", TextBox3.Text);
                cmd.Parameters.AddWithValue("@end_date", TextBox4.Text);
                cmd.Parameters.AddWithValue("@claim_id_hash", hashedData);

                cmd.ExecuteNonQuery();
                conn.Close();
                SqlCommand cmd3 = new SqlCommand("insert into Log_Table(cust,hash,Type,date_a_paid)values(@cust,@hash,@Type,@date_a_paid)", conn);
                cmd3.Parameters.AddWithValue("@cust", Session["cust_id"]);
                cmd3.Parameters.AddWithValue("@hash", hashedData);
                cmd3.Parameters.AddWithValue("@Type", "Apply For Claim");
                cmd3.Parameters.AddWithValue("@date_a_paid", DateTime.Now.Date);
                conn.Open();
                cmd3.ExecuteNonQuery();
                MessageBox.Show("Apply Claim Successfully");

                Response.Redirect("~/user/apply_for_claim.aspx");
                DropDownList1.SelectedValue = "";
                DropDownList2.SelectedValue = "";
                DropDownList3.SelectedValue = "";
                TextBox1.Text = "";
                TextBox2.Text = "";
            }
            conn.Close();
        }



      
    }


    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        conn = new SqlConnection(cs);
        conn.Open();
        SqlCommand cmd3 = new SqlCommand("select distinct(policy_type)from new_policy where policy_number=@policy_number",conn);
        cmd3.Parameters.AddWithValue("@policy_number", DropDownList1.SelectedValue);
        SqlDataAdapter da1 = new SqlDataAdapter(cmd3);
        DataSet ds1 = new DataSet();
        da1.Fill(ds1); // fill dataset
        DropDownList2.DataTextField = ds1.Tables[0].Columns["policy_type"].ToString();
        // text field name of table dispalyed in dropdown
        DropDownList2.DataValueField = ds1.Tables[0].Columns["policy_type"].ToString();
        // to retrive specific  textfield name 
        DropDownList2.DataSource = ds1.Tables[0]; //assigning datasource to the dropdownlist
        DropDownList2.DataBind(); //binding dropdownlist
        DropDownList2.Items.Insert(0, new ListItem("--select policy_type--", "0"));
        conn.Close();
        SqlCommand cmd4 = new SqlCommand("select distinct(policy) from new_policy where policy_number=@policy_number", conn);
        cmd4.Parameters.AddWithValue("@policy_number",DropDownList1.SelectedValue);
        SqlDataAdapter da2 = new SqlDataAdapter(cmd4);
        DataSet ds2 = new DataSet();
        da2.Fill(ds2); // fill dataset
        conn.Open();
        DropDownList3.DataTextField = ds2.Tables[0].Columns["policy"].ToString();
        DropDownList3.DataValueField = ds2.Tables[0].Columns["policy"].ToString();
        DropDownList3.DataSource = ds2.Tables[0];
        DropDownList3.DataBind();
        DropDownList3.Items.Insert(0, new ListItem("--select policy--", "0"));
        conn.Close();

    }
    static string ComputeSha256Hash(string rawData)
    {
        // Create a SHA256   
        using (SHA256 sha256Hash = SHA256.Create())
        {
            // ComputeHash - returns byte array  
            byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(rawData));

            // Convert byte array to a string   
            StringBuilder builder = new StringBuilder();
            for (int i = 0; i < bytes.Length; i++)
            {
                builder.Append(bytes[i].ToString("x2"));
            }
            return builder.ToString();
        }
    }  
}