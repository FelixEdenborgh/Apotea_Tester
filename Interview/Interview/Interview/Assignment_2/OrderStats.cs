using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using Microsoft.Office.Interop.Excel;
using _Excel = Microsoft.Office.Interop.Excel;
using System.Reflection;
using Excel = Microsoft.Office.Interop.Excel;
using System.IO;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Linq;
using System.Threading.Tasks;

namespace Interview.Assignment_2
{
    class Constants
    {


    }

    

    class ZipStats
    {
        public string ZipCode { get; }
        public List<ShippingMethodRow> ShippingMethods { get; }

        public ZipStats(string zipCode)
        {
            this.ZipCode = zipCode;
            this.ShippingMethods = new List<ShippingMethodRow>();
        }
    }

    class ShippingMethodRow
    {
        public int ShippingMethodID { get; }
        public int AveragePrice { get; }
        public int AverageWeight { get; }

        public ShippingMethodRow(int shippingMethodID, int averagePrice, int averageWeight)
        {
            this.ShippingMethodID = shippingMethodID;
            this.AveragePrice = averagePrice;
            this.AverageWeight = averageWeight;
        }
    }

    public class Order
    {
        public int OrderNumber { get; set; }
        public int ShippingMethodId { get; set; }
        public DateTime OrderDate { get; set; }
        public string ZipCode { get; set; }
        public List<OrderItem> Items { get; set; }
    }

    public class OrderItem
    {
        public int SkuID { get; set; }
        public int Quantity { get; set; }
        public int Weight { get; set; }
        public decimal Price { get; set; }
    }

    

    class Excel
    {
        string path = "";
        _Application excel = new _Excel.Application();
        Workbook wb;
        Worksheet ws;
        public Excel(string path, int sheet)
        {
            this.path = path;
            wb = excel.Workbooks.Open(path);
            ws = wb.Worksheets[sheet];
        }

        public string ReadCell(int i, int j)
        {
            i++;
            j++;
            if (ws.Cells[i,j].Value2 != null)
            {
                return ws.Cells[i,j].Value2;
            }
            else
            {
                return "";
            }

        }

    }

    


    internal static class OrderStats
    {

    }
 
}
