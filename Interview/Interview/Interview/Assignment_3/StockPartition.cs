using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Interview.Assignment_3
{

    public struct Reservation
    {
        public readonly string ShelfNumber;
        public readonly int ReservedQuantity;

        public Reservation(string shelfNumber, int reservedQuantity)
        {
            this.ShelfNumber = shelfNumber;
            this.ReservedQuantity = reservedQuantity;
        }
    }

    public class StockItem
    {
        public readonly int SkuID;
        public readonly string ShelfNumber;
        public readonly int Quantity;
        public int ReservedQuantity;

        public StockItem(int skuID, string shelfNumber, int quantity)
        {
            this.SkuID = skuID;
            this.ShelfNumber = shelfNumber;
            this.Quantity = quantity;
            this.ReservedQuantity = 0;
        }
    }

    internal class StockPartition
    {
        private static readonly Dictionary<int, List<StockItem>> _stockItems = new Dictionary<int, List<StockItem>>();
        public static IEnumerable<Reservation[]> GetCombinations(int skuID, int quantity)
        {
            /**
             * 4
             * [A:3], [B:2], [C:5]
             * 
             * {A:3, B:1} {A:3, C:1}, {B:2, A:2}, {B:2,C:2} {C:4}
             * 
             */
            throw new NotImplementedException();
        }
    }
}
