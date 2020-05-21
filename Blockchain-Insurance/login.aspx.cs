using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;


public partial class _Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ConnectionString);
        
    protected void Page_Load(object sender, EventArgs e)
    {
        
        //conn = new SqlConnection(cs);
        if (!IsPostBack)
        {
            if (Request.QueryString["msg"] == "logout")
            {
                Session["Patient_Id"] = "";
                //Alert.Show("You Are Logout Successfully");
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('You Are Logout Successfully')</script>");
            }
        }

    }
    
    protected void Login_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from customer_master where emailId =@username and password=@password", con);
        cmd.Parameters.AddWithValue("@username", TextBox3.Text);
        cmd.Parameters.AddWithValue("@password", TextBox4.Text);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);

        if (dt.Rows.Count > 0)
        {
            using (SqlDataReader oReader = cmd.ExecuteReader())
            {
                while (oReader.Read())
                {
                    //Session["cust_id"] = oReader["cust_id"].ToString();
                    Session["cust_id"] = dt.Rows[0].ItemArray[0];
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('You Are Login Successfully')</script>");
                    Response.Redirect("~/user/home.aspx");
                }
            }

        }

        else if (dt.Rows.Count == 0)
        {
            SqlCommand cmd1 = new SqlCommand("select * from admin_master where username_ =@username and password_=@password", con);
            cmd1.Parameters.AddWithValue("@username", TextBox3.Text);
            cmd1.Parameters.AddWithValue("@password", TextBox4.Text);
            SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
            DataTable dt1 = new DataTable();
            da1.Fill(dt1);

            if (dt1.Rows.Count > 0)
            {
                using (SqlDataReader oReader1 = cmd1.ExecuteReader())
                {
                    while (oReader1.Read())
                    {
                        Session["id"] = oReader1["id"].ToString();
                        ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('You Are Login Successfully')</script>");
                        Response.Redirect("~/admin/home.aspx");
                    }
                }

            }
        }
        else
        {
            //ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Invalid username and password')</script>");
            // Response.Write("<script>alert('Invalid Username Or Password');</script>");
            MessageBox.Show("Invalid Username or Password");
        }
        //admin login

        con.Close();

    }
}