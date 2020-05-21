using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Net.Mail;

public partial class admin_Default : System.Web.UI.Page
{
    private string cs = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    SqlConnection conn;
    SqlCommand comm;
    SqlDataAdapter adp;
    DataTable dt = new DataTable();
    public int id, h_id;
    protected void Page_Load(object sender, EventArgs e)
    {
        conn = new SqlConnection(cs);
        if (!IsPostBack)
        {
            tbl1.Visible = false;
            GridView1.Visible = true;
            Button2.Visible = false;
            Button1.Visible = false;
            using (SqlCommand cmd = new SqlCommand("select * from customer_master", conn))
            {
                DataTable dt = new DataTable();
                using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
                {
                    adp.Fill(dt);
                }
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand cmd2 = new SqlCommand("select top 1 cust_id from customer_master order by cust_id desc",conn);
        SqlDataAdapter sda2=new SqlDataAdapter(cmd2);
        DataTable dt3=new DataTable();
        sda2.Fill(dt3);
        if (dt3.Rows.Count > 0)
        {
            id = Convert.ToInt32(dt3.Rows[0]["cust_id"]);
        }
        h_id = id + 1;



        DataTable dt = new DataTable();
        using (SqlCommand cmd = new SqlCommand("select * from customer_master where emailId=@emailId", conn))
        {
            cmd.Parameters.AddWithValue("@emailId", TextBox7.Text);
            using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
            {
                adp.Fill(dt);
            }
        }
        if (dt.Rows.Count > 0)
        {
            Response.Write("<script>alert('USER ALREADY EXIST!!')</script>");
        }
        else
        {
            var chars = "QWERTYUIOPLKJHGFDSAZXCVBNMqwertyuioplkjhgfdsazxcvbnm0987654321";
            var stringargs = new char[8];
            var random = new Random();
            for (int i = 0; i < stringargs.Length; i++)
            {
                stringargs[i] = chars[random.Next(chars.Length)];
            }
            string plainData = Convert.ToString(h_id);
            Console.WriteLine("Raw data: {0}", plainData);
            string hashedData = ComputeSha256Hash(plainData); 
            string password = new String(stringargs);
            using (SqlCommand cmd = new SqlCommand("insert into customer_master(cust_name,address,phno,emailId,password,cust_id_hash) values(@cust_name,@address,@phno,@emailId,@password,@cust_id_hash)", conn))
            {
                cmd.Parameters.AddWithValue("@cust_name", TextBox2.Text);
                cmd.Parameters.AddWithValue("@address", TextBox8.Text);
                cmd.Parameters.AddWithValue("@phno", TextBox6.Text);
                cmd.Parameters.AddWithValue("@emailId", TextBox7.Text);
                cmd.Parameters.AddWithValue("@password", password);
                cmd.Parameters.AddWithValue("@cust_id_hash", hashedData);
                conn.Open();

               

                cmd.ExecuteNonQuery();
                conn.Close();
                email(TextBox7.Text, password);

                SqlCommand cmd3 = new SqlCommand("insert into Log_Table(cust,hash,Type,date_a_paid)values(@cust,@hash,@Type,@date_a_paid)", conn);
                cmd3.Parameters.AddWithValue("@cust", h_id);
                cmd3.Parameters.AddWithValue("@hash", hashedData);
                cmd3.Parameters.AddWithValue("@Type", "Registration");
                cmd3.Parameters.AddWithValue("@date_a_paid", DateTime.Now.Date);
                conn.Open();
                cmd3.ExecuteNonQuery();
                conn.Close();

                Response.Redirect("customer.aspx");
            }
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        using (SqlCommand cmd = new SqlCommand("update customer_master set cust_name=@cust_name,address=@address,phno=@phno,emailId=@emailId where cust_id=@cust_id", conn))
        {
            cmd.Parameters.AddWithValue("@cust_id", TextBox1.Text);
            cmd.Parameters.AddWithValue("@cust_name", TextBox2.Text);
            cmd.Parameters.AddWithValue("@address", TextBox8.Text);
            cmd.Parameters.AddWithValue("@phno", TextBox6.Text);
            cmd.Parameters.AddWithValue("@emailId", TextBox7.Text);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("customer.aspx");
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        tbl1.Visible = true;
        GridView1.Visible = false;
        Button2.Visible = false;
        Button1.Visible = true;
        DataTable dt = new DataTable();
        using (SqlCommand cmd = new SqlCommand("select top 1 cust_id from customer_master order by cust_id desc", conn))
        {
            using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
            {
                adp.Fill(dt);
            }
            if (dt.Rows.Count > 0)
            {
                int id = Convert.ToInt32(dt.Rows[0].ItemArray[0]);
                id = id + 1;
                TextBox1.Text = id.ToString();
            }
            else
            {
                TextBox1.Text = "1";
            }
        }
    }
    protected void RowCommand(object sender, GridViewCommandEventArgs e)
    {
        GridView1.Visible = false;
        tbl1.Visible = true;
        Button1.Visible = false;
        Button2.Visible = true;
        tbl1.Visible = true;
        if (e.CommandName == "Edit_")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow gr = GridView1.Rows[index];
            TextBox1.Text = gr.Cells[0].Text;
            TextBox2.Text = gr.Cells[1].Text;
            //DropDownList1.Text = gr.Cells[2].Text;
            //DropDownList2.Text = gr.Cells[3].Text;
            TextBox8.Text = gr.Cells[2].Text;
            TextBox6.Text = gr.Cells[3].Text;
            TextBox7.Text = gr.Cells[4].Text;
        }
        if (e.CommandName == "Delete_")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow gr = GridView1.Rows[index];
            using (SqlCommand cmd = new SqlCommand("delete from customer_master where cust_id=@cust_id", conn))
            {
                cmd.Parameters.AddWithValue("@cust_id", gr.Cells[0].Text);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Redirect("customer.aspx");
            }
        }

    }
    public void email(string mailid, string pwd)
    {
        SmtpClient smtpserver = new SmtpClient();
        MailMessage mail = new MailMessage();
        smtpserver.Credentials = new System.Net.NetworkCredential("beprojecthustlers@gmail.com", "bhaibhaibhai");
        smtpserver.Port = 587;
        smtpserver.EnableSsl = true;
        smtpserver.Host = "smtp.gmail.com";
        mail = new MailMessage();
        mail.From = new MailAddress("beprojecthustlers@gmail.com");
        mail.To.Add(mailid);
        mail.Subject = "Registration Details";
        mail.Body = "Your Login Details: " + "\n" + "\n" + "Login ID  : " + mailid + ". Password:" + pwd;
        smtpserver.Send(mail);
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