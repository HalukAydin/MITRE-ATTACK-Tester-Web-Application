using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace WebProject.pages
{
    
    public partial class loginpage : System.Web.UI.Page
    {
        static string userName = Environment.UserName;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Clear();
            }
        }
        void Clear()
        {
            txtmail.Text = txtpass.Text = lblErrorMessage1.Text= "";
        }

        protected void btnloginpage_Click(object sender, EventArgs e)
        { 
            using(SqlConnection sqlCon=new SqlConnection(@"Data Source=DESKTOP-96N0PHH\SQLEXPRESS;Initial Catalog=mitre;Integrated Security=True"))
            {
                sqlCon.Open();
                
                SqlCommand sqlCmd = new SqlCommand("SELECT * FROM USERS WHERE user_mail=@user_mail AND userpass=@userpass",sqlCon);
                sqlCmd.Parameters.AddWithValue("@user_mail",txtmail.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@userpass",txtpass.Text.Trim());
                SqlDataReader readuser = sqlCmd.ExecuteReader();
                if (readuser.Read())
                {
                    Session["userName"] = readuser["username"];
                    Session["userSurname"] = readuser["usersurname"];
                    Session["userMail"] = readuser["user_mail"];
                    Session["userPass"] = readuser["userpass"];
                    Session["userID"] = readuser["user_id"];
                    Session["btnrun1"] = "0";
                    Session["btnrun2"] = "0";
                    Session["test1id"] = "T1555";
                    Session["test1desc"] = "Credentials from Password Stores";
                    Session["test2id"] = "T1124";
                    Session["test2desc"] = "System Time Discovery";
                    Session["device"] = userName.Trim();
                    Response.Redirect("home.aspx");
                    
                }
                else
                {
                    lblErrorMessage1.Text = "Invalid User Credentials";
                }
                
                readuser.Close();
                sqlCon.Close();
                sqlCon.Dispose();
            }
                       
            
        }
    }
    
    
}