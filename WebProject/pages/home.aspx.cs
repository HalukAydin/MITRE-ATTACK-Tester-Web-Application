using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.MobileControls;
using System.Web.UI.WebControls;
using Xunit;
using System.Data.SqlClient;
using System.Data.Sql;

namespace WebProject.pages
{
       
    public partial class home : profile
    {
        
        static string userName = Environment.UserName;
        
        string directory1 = @"C:\Users\" + userName + "\\Desktop\\T1555\\T1555.exe";
        string directory2 = @"C:\Users\" + userName + "\\Desktop\\T1124\\T1124.exe";
        string directory3 = @"C:\Users\" + userName + "\\Desktop\\T1555\\windows-credentials.txt";
        string directory4 = @"C:\Users\" + userName + "\\Desktop\\T1124\\Results.txt";
        protected void Page_Load(object sender, EventArgs e)
        {
            
            lblErrorMessage.Visible = false;

        }
        const string ConnectionString = "Data Source=.\\SQLEXPRESS;Initial Catalog=mitre;Integrated Security=True ";
        const string IsSelect = "SELECT COUNT(*) FROM USED_TESTS WHERE test_id = @testid AND test_device=@testdevice";
        public int rowExist1()
        {

            int rowAffected = 0;
            SqlConnection con = new SqlConnection(ConnectionString);
            con.Open();

            SqlCommand cmd1 = new SqlCommand(IsSelect, con);
            cmd1.Parameters.AddWithValue("@testid",Session["test1id"]);
            cmd1.Parameters.AddWithValue("@testdevice",userName);
            cmd1.ExecuteNonQuery();
            rowAffected = (int)cmd1.ExecuteScalar();

            return rowAffected;
        }
        public int rowExist2()
        {

            int rowAffected = 0;
            SqlConnection con = new SqlConnection(ConnectionString);
            con.Open();

            SqlCommand cmd1 = new SqlCommand(IsSelect, con);
            cmd1.Parameters.AddWithValue("@testid", Session["test2id"]);
            cmd1.Parameters.AddWithValue("@testdevice", userName);
            cmd1.ExecuteNonQuery();
            rowAffected = (int)cmd1.ExecuteScalar();

            return rowAffected;
        }
        protected void btndownload1_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.ContentType = "application/zip";
            Response.AddHeader("Content-Disposition", "attachment; filename=T1555.zip");
            Response.WriteFile(Server.MapPath("~/pscript/T1555.zip"));
            Response.End();
        }

        protected void btnrun1_Click(object sender, EventArgs e)
        {
                if (File.Exists(directory1))
                {
                        SqlConnection sqlCon = new SqlConnection(ConnectionString);
                        sqlCon.Open();
                        SqlCommand sqlCmd = new SqlCommand("INSERT INTO USED_TESTS (test_id, user_id,test_desc,test_device) Values ('" + Session["test1id"] + "', '" + Session["userID"] + "', '" + Session["test1desc"] + "','" + userName + "')", sqlCon);
                        ProcessStartInfo info = new ProcessStartInfo();
                        info.FileName = directory1;
                        info.Arguments = "";
                        info.WindowStyle = ProcessWindowStyle.Normal;
                        info.WorkingDirectory = Path.GetDirectoryName(directory1);
                        Process p = Process.Start(info);
                        p.StartInfo.UseShellExecute = false;
                        sqlCmd.ExecuteNonQuery();
                        sqlCon.Close();
                         
                }
                else
                {
                    lblErrorMessage.Visible = true;

                    lblErrorMessage.Text = "First Download Test !!! ";
                }
            
            
        }

        protected void btnrun2_Click(object sender, EventArgs e)
        {
            if (File.Exists(directory2))
            {
                SqlConnection sqlCon = new SqlConnection(ConnectionString);
                sqlCon.Open();
                SqlCommand sqlCmd = new SqlCommand("INSERT INTO USED_TESTS (test_id, user_id,test_desc,test_device) Values ('" + Session["test2id"] + "', '" + Session["userID"] + "', '" + Session["test2desc"] + "','" + userName + "')", sqlCon);
                ProcessStartInfo info = new ProcessStartInfo();
                info.FileName = directory2;
                info.Arguments = "";
                info.WindowStyle = ProcessWindowStyle.Normal;
                info.WorkingDirectory = Path.GetDirectoryName(directory2);
                Process p = Process.Start(info);
                p.StartInfo.UseShellExecute = false;
                sqlCmd.ExecuteNonQuery();
                sqlCon.Close();

            }
            else
            {
                lblErrorMessage.Visible = true;

                lblErrorMessage.Text = "First Download Test !!! ";
            }


        }

        protected void btndownload2_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.ContentType = "application/zip";
            Response.AddHeader("Content-Disposition", "attachment; filename=T1124.zip");
            Response.WriteFile(Server.MapPath("~/pscript/T1124.zip"));
            Response.End();
        }
    }
}