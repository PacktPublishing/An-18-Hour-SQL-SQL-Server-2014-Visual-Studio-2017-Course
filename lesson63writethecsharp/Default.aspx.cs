using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    string connString = ConfigurationManager.ConnectionStrings["personTableConnectionString"].ConnectionString;
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand comm = new SqlCommand("InsertProc", conn);
        comm.CommandType = CommandType.StoredProcedure;
        comm.Parameters.AddWithValue("@Name", txtName.Text);
        comm.Parameters.AddWithValue("@Email", txtEmail.Text);
        comm.Parameters.AddWithValue("@DateSaved", Calendar1.SelectedDate);
        try
        {
            conn.Open();
            comm.ExecuteNonQuery();
        }
        catch(Exception ex)
        {
            lblError.Text = ex.Message;
        }
        finally
        {
            conn.Close();
        }
        GridView1.DataBind();

    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        txtDate.Text = Calendar1.SelectedDate.ToShortDateString();//10/24/2017
    }
}