using System;
using System.Data;//data set resides there
using System.Data.SqlClient;//data adapter resides there

public partial class _Default : System.Web.UI.Page
{
    private DataSet ds = new DataSet();
    private SqlDataAdapter adapter;
    string connString = @"Data Source=DESKTOP-4L6NSGO\sqlexpress;Initial Catalog=mydbase;Integrated Security=True";
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        //runs when button is clicked
        using (SqlConnection conn = new SqlConnection(connString))
        {
            try
            {
                adapter = new SqlDataAdapter(txtQuery.Text, conn);
                adapter.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.AutoGenerateColumns = true;
                //GridView1.DataBind();
            }
            catch(Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

    }
}