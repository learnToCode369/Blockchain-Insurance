using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mime;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

public partial class faculty_New_Policy : System.Web.UI.Page
{
    private string cs = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    SqlConnection conn;
    public static string imagepath;
    public static string filepath;
    public static string menupath;
    public int id, h_id;
    public int cust_id;
    protected void Page_Load(object sender, EventArgs e)
    {
        string abcd = Session["cust_id"].ToString();
        Session["policy_id"] = "";
        conn = new SqlConnection(cs);
       
        conn.Open();

        //string abcd = Session["cust_id"].ToString();
        SqlCommand cmd1 = new SqlCommand("select distinct(policy_type)from manage_policy ", conn);
        SqlDataAdapter da = new SqlDataAdapter(cmd1);
        DataSet ds = new DataSet();
        da.Fill(ds);  // fill dataset
        DropDownList1.DataTextField = ds.Tables[0].Columns["policy_type"].ToString(); // text field name of table dispalyed in dropdown
        DropDownList1.DataValueField = ds.Tables[0].Columns["policy_type"].ToString();             // to retrive specific  textfield name 
        DropDownList1.DataSource = ds.Tables[0];      //assigning datasource to the dropdownlist
        DropDownList1.DataBind();  //binding dropdownlist
       conn.Close();
        conn.Open();
        SqlCommand cmd3 = new SqlCommand("select distinct(policy)from manage_policy ", conn);
        SqlDataAdapter da1 = new SqlDataAdapter(cmd3);
        DataSet ds1 = new DataSet();
        da1.Fill(ds1);  // fill dataset
        DropDownList2.DataTextField = ds1.Tables[0].Columns["policy"].ToString();
        DropDownList2.DataValueField = ds1.Tables[0].Columns["policy"].ToString();
        DropDownList2.DataSource = ds1.Tables[0];
        DropDownList2.DataBind();
        conn.Close();
        conn.Open();
        SqlDataReader myReader = null;  
        //string abcd = Session["cust_id"].ToString();
        SqlCommand cmd2 = new SqlCommand("select cust_name,phno from customer_master where cust_id='" + abcd + "' ", conn);
        myReader = cmd2.ExecuteReader();
        while (myReader.Read())
        {
            TextBox1.Text = (myReader["cust_name"]).ToString();
            TextBox4.Text = (myReader["phno"]).ToString();
        }
        conn.Close();


    }
    

    protected void Add_Policy_Click(object sender, EventArgs e)
    {
        SqlCommand cmd2 = new SqlCommand("select top 1 policy_id from new_policy order by policy_id desc", conn);
        SqlDataAdapter sda2 = new SqlDataAdapter(cmd2);
        DataTable dt3 = new DataTable();
        sda2.Fill(dt3);
        if (dt3.Rows.Count > 0)
        {
            id = Convert.ToInt32(dt3.Rows[0]["policy_id"]);
        }
        h_id = id + 1;

        


        Random ran = new Random();
        int policy_number = ran.Next(1000);
        conn.Open();
        string filename = Path.GetFileName(FileUpload1.FileName);
        FileUpload1.SaveAs(Server.MapPath("/AddharCard/") + filename);
        string filepath = "/AddharCard/" + filename;

        string fileform = Path.GetFileName(FileUpload2.FileName);
        FileUpload2.SaveAs(Server.MapPath("/UserForm/") + fileform);
        string menu = "/UserForm/" + fileform;
        using (SqlCommand cmd = new SqlCommand("insert into new_policy(cust_id,policy_number,name,age,policy_type,policy,purchase_date,phno,premium_amount,start_date,end_date,aadhar,form,policy_id_hash) values(@cust_id,@policy_number,@name,@age,@policy_type,@policy,@purchase_date,@phno,@premium_amount,@start_date,@end_date,@aadhar,@form,@policy_id_hash)", conn))
        {
            string plainData = Convert.ToString(h_id);
            string hashedData = ComputeSha256Hash(plainData);

            cmd.Parameters.AddWithValue("@cust_id", Session["cust_id"]);
            cmd.Parameters.AddWithValue("@policy_number", policy_number);
            cmd.Parameters.AddWithValue("@name", TextBox1.Text);
            cmd.Parameters.AddWithValue("@age", TextBox2.Text);
            cmd.Parameters.AddWithValue("@policy_type", DropDownList1.SelectedValue);
            cmd.Parameters.AddWithValue("@policy", DropDownList2.SelectedValue);
            cmd.Parameters.AddWithValue("@purchase_date", TextBox3.Text);
            //cmd.Parameters.AddWithValue("@address", TextBox4.Text);
            cmd.Parameters.AddWithValue("@phno", TextBox4.Text);
            cmd.Parameters.AddWithValue("@premium_amount", TextBox5.Text);
            cmd.Parameters.AddWithValue("@start_date", TextBox6.Text);
            cmd.Parameters.AddWithValue("@end_date",TextBox7.Text);
            cmd.Parameters.AddWithValue("@aadhar", filepath);
            cmd.Parameters.AddWithValue("@form", menu);
            cmd.Parameters.AddWithValue("@policy_id_hash", hashedData);
            
            cmd.ExecuteNonQuery();
            conn.Close();

           // SqlCommand cmd4 = new SqlCommand("select cust_id_hash from customer_master where cust_id=@cust", conn);
           // cmd4.Parameters.AddWithValue("@cust", Session["cust_id"]);
           //SqlDataAdapter sda3=new SqlDataAdapter(cmd4);
           // DataTable dt4=new DataTable();
           // sda3.Fill(dt4);
           // if (dt4.Rows.Count > 0)
           // {
           //     cust_id = Convert.ToInt32(dt4.Rows[0]["cust_id_hash"]);
           // }

            //SqlCommand cmd3 = new SqlCommand("Update  Log_Table set policy_i=@policy_id where cust_id=@cust_id", conn);
            //cmd.Parameters.AddWithValue("@cust_id", cust_id);
            //cmd3.Parameters.AddWithValue("@policy_id", hashedData);
            //conn.Open();
            //cmd3.ExecuteNonQuery();
            SqlCommand cmd3 = new SqlCommand("insert into Log_Table(cust,hash,Type,date_a_paid)values(@cust,@hash,@Type,@date_a_paid)",conn);
            cmd3.Parameters.AddWithValue("@cust", Session["cust_id"]);
            cmd3.Parameters.AddWithValue("@hash", hashedData);
            cmd3.Parameters.AddWithValue("@Type", "New Policy");
            cmd3.Parameters.AddWithValue("@date_a_paid", DateTime.Now.Date);
            conn.Open();
            cmd3.ExecuteNonQuery();
           MessageBox.Show("New Policy added Successfully");
            Response.Redirect("~/user/New_Policy.aspx");
            TextBox1.Text = "";
            TextBox4.Text = "";
            conn.Close();
        }
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