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

public partial class admin_managepolicy : System.Web.UI.Page
{
    private string cs = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    SqlConnection conn;
    SqlCommand comm;
    SqlDataAdapter adp;
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        conn = new SqlConnection(cs);
        if (!IsPostBack)
        {
            tbl1.Visible = false;
            GridView1.Visible = true;
            Button2.Visible = false;
            Button1.Visible = false;
            using (SqlCommand cmd = new SqlCommand("select * from manage_policy", conn))
            {
                DataTable dt = new DataTable();
                using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
                {
                    adp.Fill(dt);
                }
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            conn.Open();
            //string abcd = Session["cust_id"].ToString();
            SqlCommand cmd1 = new SqlCommand("select * from policy_master", conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd1);
            DataSet ds = new DataSet();
            da.Fill(ds);  // fill dataset
            DropDownList1.DataTextField = ds.Tables[0].Columns["policy_type"].ToString(); // text field name of table dispalyed in dropdown
            DropDownList1.DataValueField = ds.Tables[0].Columns["policy_type"].ToString();             // to retrive specific  textfield name 
            DropDownList1.DataSource = ds.Tables[0];      //assigning datasource to the dropdownlist
            DropDownList1.DataBind();  //binding dropdownlist
            conn.Close();

            conn.Open();
            SqlCommand cmd2 = new SqlCommand("select * from policy_master", conn);
            SqlDataAdapter da1 = new SqlDataAdapter(cmd2);
            DataSet ds1 = new DataSet();
            da1.Fill(ds1);  // fill dataset
            DropDownList2.DataTextField = ds1.Tables[0].Columns["policy"].ToString(); // text field name of table dispalyed in dropdown
            DropDownList2.DataValueField = ds1.Tables[0].Columns["policy"].ToString();             // to retrive specific  textfield name 
            DropDownList2.DataSource = ds1.Tables[0];      //assigning datasource to the dropdownlist
            DropDownList2.DataBind();  //binding dropdownlist


            conn.Close();
        }
       
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        using (SqlCommand cmd = new SqlCommand("insert into manage_policy(policy_type,policy,description) values(@policy_type,@policy,@description)", conn))
        {

            //cmd.Parameters.AddWithValue("@policy_type", TextBox1.Text);
           // cmd.Parameters.AddWithValue("@policy", TextBox2.Text);
            cmd.Parameters.AddWithValue("@policy_type", DropDownList1.SelectedValue);
            cmd.Parameters.AddWithValue("@policy", DropDownList2.SelectedValue);
            cmd.Parameters.AddWithValue("@description", TextBox8.Text);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            MessageBox.Show("Added Successfully");
            Response.Redirect("~/admin/managepolicy.aspx");
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        using (SqlCommand cmd = new SqlCommand("update manage_policy set policy_type=@policy_type,policy=@policy,description=@description where manage_id=@manage_id", conn))
        {
           // cmd.Parameters.AddWithValue()
            cmd.Parameters.AddWithValue("@manage_id", TextBox9.Text);
            cmd.Parameters.AddWithValue("@policy_type", DropDownList1.SelectedValue);
            cmd.Parameters.AddWithValue("@policy", DropDownList2.SelectedValue);
            cmd.Parameters.AddWithValue("@description", TextBox8.Text);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            MessageBox.Show("update Successfully");
            Response.Redirect("~/admin/managepolicy.aspx");
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        tbl1.Visible = true;
        GridView1.Visible = false;
        Button2.Visible = false;
        Button1.Visible = true;
        DataTable dt = new DataTable();
        using (SqlCommand cmd = new SqlCommand("select top 1 manage_id from manage_policy order by manage_id desc", conn))
        {
            using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
            {
                adp.Fill(dt);
            }
            if (dt.Rows.Count > 0)
            {
                int id = Convert.ToInt32(dt.Rows[0].ItemArray[0]);
                id = id + 1;
                TextBox9.Text = id.ToString();
            }
            else
            {
                TextBox9.Text = "1";
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
            TextBox9.Text = gr.Cells[0].Text;
            DropDownList1.SelectedValue = gr.Cells[1].Text;
            DropDownList2.SelectedValue = gr.Cells[2].Text;
            TextBox8.Text = gr.Cells[3].Text;
           
        }
        if (e.CommandName == "Delete_")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow gr = GridView1.Rows[index];
            using (SqlCommand cmd = new SqlCommand("delete from manage_policy where manage_id=@manage_id", conn))
            {
                cmd.Parameters.AddWithValue("@manage_id", gr.Cells[0].Text);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                MessageBox.Show("Delete Successfully");
                Response.Redirect("~/admin/managepolicy.aspx");
            }
        }

    }
}