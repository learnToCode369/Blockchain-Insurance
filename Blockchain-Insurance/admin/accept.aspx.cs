using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_accept : System.Web.UI.Page
{
    private string cs = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    SqlConnection conn;
    //SqlCommand comm;
    SqlDataAdapter adp;
    DataTable dt = new DataTable();
    protected string cust_id;
    public int id, h_id;
   
    protected void Page_Load(object sender, EventArgs e)
    {
        conn=new SqlConnection(cs);
        SqlCommand cmd = new SqlCommand("select a.cust_id,a.policy_number,customer_master.cust_name,customer_master.phno,a.emailId,a.claim_amount from customer_master inner join (select cust_id,policy_number,emailId,claim_amount from apply_for_claim where cust_id=@cust_id)as a on a.cust_id=customer_master.cust_id", conn);
        cmd.Parameters.AddWithValue("@cust_id", Request.QueryString["cust_id"]);
        SqlDataAdapter sda=new SqlDataAdapter(cmd);
        dt=new DataTable();
        sda.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            cust_id = dt.Rows[0]["cust_id"].ToString();
            TextBox1.Text = dt.Rows[0]["policy_number"].ToString();
            TextBox2.Text = dt.Rows[0]["cust_name"].ToString();
            TextBox3.Text = dt.Rows[0]["phno"].ToString();
            TextBox4.Text = dt.Rows[0]["emailId"].ToString();
            TextBox5.Text = dt.Rows[0]["claim_amount"].ToString();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        conn = new SqlConnection(cs);

        SqlCommand cmd2 = new SqlCommand("select top 1 claimpay_id from amount_paid_by_admin order by claimpay_id desc", conn);
        SqlDataAdapter sda2 = new SqlDataAdapter(cmd2);
        DataTable dt3 = new DataTable();
        sda2.Fill(dt3);
        if (dt3.Rows.Count > 0)
        {
            id = Convert.ToInt32(dt3.Rows[0]["claimpay_id"]);
        }
        h_id = id + 1;

        SqlCommand cmd = new SqlCommand("Insert into amount_paid_by_admin(policy_number,policy_holder_name,phno,emailid,claim_amount,get_amount,claimpay_id_hash,cust_id) values(@policy_number,@policy_holder_name,@phno,@emailid,@claim_amount,@get_amount,@claimpay_id_hash,@cust_id)", conn);

        string plainData = Convert.ToString(h_id);
        string hashedData = ComputeSha256Hash(plainData);


        cmd.Parameters.AddWithValue("@policy_number", TextBox1.Text);
        cmd.Parameters.AddWithValue("@policy_holder_name", TextBox2.Text);
        cmd.Parameters.AddWithValue("@phno", TextBox3.Text);
        cmd.Parameters.AddWithValue("@emailid", TextBox4.Text);
        cmd.Parameters.AddWithValue("@claim_amount", TextBox5.Text);
        cmd.Parameters.AddWithValue("@get_amount", TextBox6.Text);
        cmd.Parameters.AddWithValue("@claimpay_id_hash", hashedData);
        cmd.Parameters.AddWithValue("@cust_id", Request.QueryString["cust_id"]);
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        SqlCommand cmd3 = new SqlCommand("insert into Log_Table(cust,hash,Type,date_a_paid)values(@cust,@hash,@Type,@date_a_paid)", conn);
        cmd3.Parameters.AddWithValue("@cust", cust_id);
        cmd3.Parameters.AddWithValue("@hash", hashedData);
        cmd3.Parameters.AddWithValue("@Type", "Claim By Admin");
        cmd3.Parameters.AddWithValue("@date_a_paid", DateTime.Now.Date);
        conn.Open();
        cmd3.ExecuteNonQuery();


        SmtpClient smtpserver = new SmtpClient();
        MailMessage mail = new MailMessage();
        smtpserver.Credentials = new System.Net.NetworkCredential("beprojecthustlers@gmail.com", "bhaibhaibhai");
        smtpserver.Port = 587;
        smtpserver.EnableSsl = true;
        smtpserver.Host = "smtp.gmail.com";
        mail = new MailMessage();
        mail.From = new MailAddress("beprojecthustlers@gmail.com");
        mail.To.Add(TextBox4.Text);
        mail.Subject = "Claim Amount Details";
        mail.Body = "Your Claim Amount Details: " + "\n" + "\n" + "Email-ID  : " + TextBox4.Text + ". And Claim Amount is :" + TextBox6.Text;
        smtpserver.Send(mail);
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        TextBox4.Text = "";
        TextBox5.Text = "";
        TextBox6.Text = "";
        //SqlCommand cmd1 = new SqlCommand("delete from apply_for_claim where cust_id=@cust_id",conn);
        //cmd1.Parameters.AddWithValue("@cust_id", cust_id);
        //cmd1.ExecuteNonQuery();
        //Response.Redirect("~/admin/view_claim.aspx");
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