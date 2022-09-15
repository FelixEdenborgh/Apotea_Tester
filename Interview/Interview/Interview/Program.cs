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


            string connetionString;
            connetionString = @"Data Source=FELIX-PC\SQLEXPRESS;Initial Catalog=Apotea;Integrated Security=True";
            


            SqlConnection cnn = new SqlConnection(connetionString);
            SqlCommand command = new SqlCommand("SELECT data1.zip_code as ZipCode, data1.order_number as OrderNumber, data2.sku_id as SkuID, data2.quantity as Quantity, data2.price as Price, data3.[weight] as Weight FROM data1,data2,data3 where data3.sku_id=data2.sku_id and data2.order_number=data1.order_number and data1.order_date >= Dateadd(Month, Datediff(Month, 0, DATEADD(m, -12,current_timestamp)), 0) order by zip_code desc\r\n\r\n", cnn);
            cnn.Open();
            var dataReader = command.ExecuteReader();


            var list = new List<mylist>();

            Int16 p = 0;
            int oldZip = 0;
            int Length_A;

            while (dataReader.Read())
            {
                if (oldZip == 0) { oldZip = (int)dataReader["ZipCode"]; }
                if ((int)dataReader["ZipCode"] == oldZip)
                {
                    p += (Int16)dataReader["Price"];
                }
                else
                {
                    Console.WriteLine(oldZip + " - " + p);
                    p = 0;
                    oldZip = (int)dataReader["ZipCode"];
                    p += (Int16)dataReader["Price"];
                    
                }
                list.Add(new mylist { zip = oldZip, price = p });
            }

            List<mylist> sorted = list.OrderBy(x => x.price).ToList();
            Console.WriteLine(sorted);

        }

        public class mylist
        {
            public int zip { get; set; }
            public Int16 price { get; set; }
        }

        

        public static void GetWeightAndPriceForTopRegions()
        {

        }





    }
        


        
    

   
}