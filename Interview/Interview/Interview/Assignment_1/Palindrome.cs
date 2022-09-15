using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Interview.Assignment_1
{
    internal class Palindrome
    {
        public bool IsPalindrom(string testword)
        {
            bool p = true;
            string lower = testword.ToLower();

            for (int i = 0; i < lower.Length - 1; i++)
            {
                int m = lower.Length - 1 - i;

                if (lower[i] != lower[m])
                {
                    p = false;
                }
            }
            return p;

        }

    }
    
}
