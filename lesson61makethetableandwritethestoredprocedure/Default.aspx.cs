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
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
        finally
        {
            conn.Close();
        }
        GridView1.DataBind();
        //after video: added line below to clear input boxes after the submit button is clicked
        txtDate.Text = txtEmail.Text = txtName.Text = "";
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {

        txtDate.Text = Calendar1.SelectedDate.ToShortDateString();//10/24/2017
    }

    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox1.Checked)
        {
            Calendar1.Visible = true;//runs after check is applied
            CheckBox1.Text = "Uncheck to insert date and hide.";
        }
        else
        {
            Calendar1.Visible = false;//runs after check is removed
            CheckBox1.Text = "Check to show calendar.";
        }

    }
    //block below is added after the video
    //it allows hiding the entire contents of the div so it looks collapsed
    protected void chkHideShowAll_CheckedChanged(object sender, EventArgs e)
    {
        if (chkHideShowAll.Checked)
            innerDiv.Visible = true;
        else
            innerDiv.Visible = false;
    }
}