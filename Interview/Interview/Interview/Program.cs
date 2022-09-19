using Interview.Assignment_1;
using Interview.Assignment_2;
using Microsoft.Office.Interop.Excel;
using System.Data.SqlClient;
using static System.Net.Mime.MediaTypeNames;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data.Common;
using System.Configuration;
using System.Data;
using DataTable = System.Data.DataTable;
using System.Collections;

namespace Interview
{
    class Program
    {

        public static void Main(string[] args)
        {





            // Tast 1
            /*
            Console.WriteLine("Please enter a word");
            string testword = Console.ReadLine();


            Palindrome p = new Palindrome();
            bool Palindrome = p.IsPalindrom(testword);



            if (Palindrome == true)
            {
                Console.WriteLine("The given word is a Palidrom");
            }
            else
            {
                Console.WriteLine("The given word is not an Palidrom");
            }

            Console.ReadLine(); */
            // Slutet på task 1


            // Test 2:

            GetWeightAndPriceForTopRegions();
        }


        public static void GetWeightAndPriceForTopRegions()
        {
            string connetionString;
            connetionString = @"Data Source=FELIX-PC\SQLEXPRESS;Initial Catalog=Apotea;Integrated Security=True";

         
            SqlConnection cnn = new SqlConnection(connetionString);
            SqlCommand command = new SqlCommand("select ZipCode, shipping_method_id, AVG(Price) as Average_Price, AVG([Weight]) as Average_Weight, SUM(Quantity) as Totaly_Orders from tempT group by ZipCode, shipping_method_id order by Totaly_Orders desc", cnn);
            cnn.Open();
            var dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {
                Console.WriteLine(dataReader["ZipCode"] + " - " + dataReader["shipping_method_id"] + " - " + dataReader["Average_Price"] + " - " + dataReader["Average_Weight"] + " - " + dataReader["Totaly_Orders"]);

            }

        }





    }
        


        
    

   
}
