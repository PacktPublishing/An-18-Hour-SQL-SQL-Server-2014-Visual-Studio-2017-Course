using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

public partial class _Default : System.Web.UI.Page
{
    string connString = @"Data Source=DESKTOP-4L6NSGO\SQLEXPRESS;
Initial Catalog=AdventureWorks2014;Integrated Security=True;
Connect Timeout=15;Encrypt=False;TrustServerCertificate=True;
ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
    protected void Button1_Click(object sender, EventArgs e)
    {
        using (SqlConnection conn = new SqlConnection(connString))
        {
            SqlCommand comm = new SqlCommand("Select SalesYTD From Sales.SalesPerson", conn);
            SqlDataAdapter adapter = new SqlDataAdapter(comm);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            var totalYTDSales = dt.AsEnumerable().Sum(row => row.Field<decimal>("SalesYTD"));
            lblTotalYTDSales.Text = string.Format("Total Year To Date Sales: {0:C}", totalYTDSales);
        }
    }
}