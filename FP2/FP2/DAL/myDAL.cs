using System;
using System.Web;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;

namespace FP2.DAL
{
    public class myDAL
    {
        private static readonly string connString = System.Configuration.ConfigurationManager.ConnectionStrings["sqlCon1"].ConnectionString;

        public int authenticate_dal(int inputAccno, int inputPin)   //log in
        {
            DataSet ds = new DataSet();
            int error;

            SqlConnection con = new SqlConnection(connString);      //open connection
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("authenticate", con);          //name of sp
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@accno", SqlDbType.Int);        //input parameters
                cmd.Parameters.Add("@pin", SqlDbType.Int);
                cmd.Parameters.Add("@error", SqlDbType.Int).Direction = ParameterDirection.Output;  //output parameter

                cmd.Parameters["@accno"].Value = inputAccno;        //set parameter values
                cmd.Parameters["@pin"].Value = inputPin;

                cmd.ExecuteNonQuery();                              //execute the query

                string e = cmd.Parameters["@error"].Value.ToString();
                Int32.TryParse(e, out error);

            }
            catch
            {
                return -1;          //-1 error in execution
            }
            finally
            {
                con.Close();
            }
            return error;           //successfully executed

        }

        public int validate_amount_dal(int accountno, int amount)   //withdrawals
        {
            int error;
            SqlConnection con = new SqlConnection(connString);      //open connection
            con.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("check_Amount", con);          //name of sp
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@amount", SqlDbType.Int);       //input parameters
                cmd.Parameters.Add("@accno", SqlDbType.Int);
                cmd.Parameters.Add("@error", SqlDbType.Int).Direction = ParameterDirection.Output;  //output parameter

                cmd.Parameters["@amount"].Value = amount;           //assign values to parameters
                cmd.Parameters["@accno"].Value = accountno;

                cmd.ExecuteNonQuery();

                string et = cmd.Parameters["@error"].Value.ToString();
                Int32.TryParse(et, out error);

            }
            catch
            {
                return -1;
            }
            finally
            {
                con.Close();
            }
            return error;
        }

        public int validate_transfer_dal(int senAccNo, int recAccNo, int amount)    //validate transfer requests
        {
            int error;
            SqlConnection con = new SqlConnection(connString);      //open connection
            con.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("validate_transfer", con);          //name of sp
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@senderAcNo", SqlDbType.Int);       //input parameters
                cmd.Parameters.Add("@recieverAcNo", SqlDbType.Int);
                cmd.Parameters.Add("@amount", SqlDbType.Int);
                cmd.Parameters.Add("@error", SqlDbType.Int).Direction = ParameterDirection.Output;  //output parameter

                cmd.Parameters["@senderAcNo"].Value = senAccNo;           //assign values to parameters
                cmd.Parameters["@recieverAcNo"].Value = recAccNo;
                cmd.Parameters["@amount"].Value = amount;

                cmd.ExecuteNonQuery();

                Int32.TryParse(cmd.Parameters["@error"].Value.ToString(), out error);

            }
            catch
            {
                return -1;
            }
            finally
            {
                con.Close();
            }
            return error;
        }

        public int check_balance_dal(int accountNo)
        {
            int balance;
            SqlConnection con = new SqlConnection(connString);      //open connection
            con.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("balance", con);          //name of sp
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@accno", SqlDbType.Int);       //input parameters
                cmd.Parameters.Add("@bal", SqlDbType.Int).Direction = ParameterDirection.Output;  //output parameter

                cmd.Parameters["@accno"].Value = accountNo;           //assign values to parameters
                
                cmd.ExecuteNonQuery();

                Int32.TryParse(cmd.Parameters["@bal"].Value.ToString(), out balance);

            }
            catch
            {
                return -1;
            }
            finally
            {
                con.Close();
            }
            return balance;

        }

        public int change_pin_dal(int accountNo, int currentPin, int newPin)
        {
            int e;
            SqlConnection con = new SqlConnection(connString);      //open connection
            con.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("changePin", con);          //name of sp
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@oldpin", SqlDbType.Int);       //input parameters
                cmd.Parameters.Add("@newpin", SqlDbType.Int);       //input parameters
                cmd.Parameters.Add("@accno", SqlDbType.Int);       //input parameters
                cmd.Parameters.Add("@error", SqlDbType.Int).Direction = ParameterDirection.Output;  //output parameter

                cmd.Parameters["@oldpin"].Value = currentPin;           //assign values to parameters
                cmd.Parameters["@newpin"].Value = newPin;
                cmd.Parameters["@accno"].Value = accountNo;

                cmd.ExecuteNonQuery();

                Int32.TryParse(cmd.Parameters["@error"].Value.ToString(), out e);

            }
            catch
            {
                return -1;
            }
            finally
            {
                con.Close();
            }
            return e;

        }

        public int add_account_dal(int userid, int accno, int balance)
        {
            int e;
            SqlConnection con = new SqlConnection(connString);      //open connection
            con.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("add_account", con);          //name of sp
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@userid", SqlDbType.Int);       //input parameters
                cmd.Parameters.Add("@accno", SqlDbType.Int);       //input parameters
                cmd.Parameters.Add("@balance", SqlDbType.Int);       //input parameters
                cmd.Parameters.Add("@error", SqlDbType.Int).Direction = ParameterDirection.Output;  //output parameter

                cmd.Parameters["@userid"].Value = userid;           //assign values to parameters
                cmd.Parameters["@accno"].Value = accno;
                cmd.Parameters["@balance"].Value = balance;

                cmd.ExecuteNonQuery();

                Int32.TryParse(cmd.Parameters["@error"].Value.ToString(), out e);

            }
            catch
            {
                return -1;
            }
            finally
            {
                con.Close();
            }
            return e;
        }

        public int add_cash_dal(int amount)
        {
            SqlConnection con = new SqlConnection(connString);      //open connection
            con.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("addCash", con);          //name of sp
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@amount", SqlDbType.Int);       //input parameters
                
                cmd.Parameters["@amount"].Value = amount;           //assign values to parameters
                
                cmd.ExecuteNonQuery();

            }
            catch
            {
                return -1;
            }
            finally
            {
                con.Close();
            }
            return 0;
        }

        public int suspend_dal(int accno)
        {
            int e;
            SqlConnection con = new SqlConnection(connString);      //open connection
            con.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("suspendUser", con);          //name of sp
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@accno", SqlDbType.Int);       //input parameters
                cmd.Parameters.Add("@error", SqlDbType.Int).Direction = ParameterDirection.Output;  //output parameter


                cmd.Parameters["@accno"].Value = accno;           //assign values to parameters

                cmd.ExecuteNonQuery();

                Int32.TryParse(cmd.Parameters["@error"].Value.ToString(), out e);

            }
            catch
            {
                return -1;
            }
            finally
            {
                con.Close();
            }
            return e;
        }

        public DataSet transfers(int accno)
        {
            DataSet ds = new DataSet(); //declare and instantiate new dataset
            SqlConnection con = new SqlConnection(connString); //declare and instantiate new SQL connection
            con.Open(); // open sql Connection
            SqlCommand cmd;
            try
            {
                string acc = accno.ToString();
                string q = "Select RecieverAccID as Sent_To, Amount, DateOf from Transfers where DATEDIFF(month,DateOf,getdate()) = 1 and SenderAccID = " + acc; 
                cmd = new SqlCommand(q, con);  //instantiate SQL command 
                cmd.CommandType = CommandType.Text; //set type of sqL Command
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds); //Add the result  set  returned from SQLCommand to ds
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }

            return ds; //return the dataset
        }

        public DataSet withdrawals(int accno)
        {
            DataSet ds = new DataSet(); //declare and instantiate new dataset
            SqlConnection con = new SqlConnection(connString); //declare and instantiate new SQL connection
            con.Open(); // open sql Connection
            SqlCommand cmd;
            try
            {
                string acc = accno.ToString();
                string q = "select Amount, DateOf from Withdrawals where DATEDIFF(month,DateOf,getdate()) = 1 and AccID = " + acc;
                cmd = new SqlCommand(q, con);  //instantiate SQL command 
                cmd.CommandType = CommandType.Text; //set type of sqL Command
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds); //Add the result  set  returned from SQLCommand to ds
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }

            return ds;
        }
       
        public string get_UserName(int accno)
        {
            string s;
            SqlConnection con = new SqlConnection(connString);      //open connection
            con.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("getUserName", con);          //name of sp
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@accno", SqlDbType.Int);       //input parameters
                cmd.Parameters.Add("@username", SqlDbType.VarChar).Direction = ParameterDirection.Output;  //output parameter


                cmd.Parameters["@accno"].Value = accno;           //assign values to parameters

                cmd.ExecuteNonQuery();

                s = cmd.Parameters["username"].ToString();

            }
            catch
            {
                return "e";
            }
            finally
            {
                con.Close();
            }
            return s;

        }
        public DataSet SelectItem() //to get the values of all the items from table Items and return the Dataset
        {

            DataSet ds = new DataSet(); //declare and instantiate new dataset
            SqlConnection con = new SqlConnection(connString); //declare and instantiate new SQL connection
            con.Open(); // open sql Connection
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("Select * from Accounts", con);  //instantiate SQL command 
                cmd.CommandType = CommandType.Text; //set type of sqL Command
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds); //Add the result  set  returned from SQLCommand to ds
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }

            return ds; //return the dataset
        }
    }
}
