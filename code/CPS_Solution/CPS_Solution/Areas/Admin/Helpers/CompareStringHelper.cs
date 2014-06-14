using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CPS_Solution.AdminAreas.Helpers
{
    public class CompareStringHelper
    {
        /// <summary>
        ///  get a list of pair adjacent letter
        /// </summary>
        /// <param name="str">input String</param>
        /// <returns>A lists of pair adjacent letter</returns>
        private static IEnumerable<string> LetterPair(string str) {
            var pairs = new List<string>();
            if (str.Length == 1) {
                pairs.Add(str);
                return pairs;
            }
            for (int i = 0; i < str.Length - 1; i++) {
                string tmp = str.Substring(0, 2);
                pairs.Add(tmp);
            }
            return pairs;
        }
        /// <summary>
        /// Split words then get A lists of pair adjacent letter
        /// </summary>
        /// <param name="str">Input String</param>
        /// <returns> A lists of pair adjacent letter</returns>
        private static List<string> WordPairs(string str) {
            var allpairs = new List<string>();
            string[] words = str.Split(' ');
            foreach (string word in words) {
                IEnumerable<string> tmp = LetterPair(word);
                foreach (string s in tmp) {
                    allpairs.Add(s);
                }
            }
            return allpairs;
        }
        /// <summary>
        ///  Matching percent between 2 string
        /// </summary>
        /// <param name="str1">Input String 1</param>
        /// <param name="str2">Input String 2</param>
        /// <returns> Percent  dat 2 string match</returns>
        public static double CompareString(string str1, string str2) { 

            List<string> wordpair1 =WordPairs(str1.ToUpper());
            List<string> wordpair2 = WordPairs(str1.ToUpper());
            int union = wordpair1.Count + wordpair2.Count;
            int sameNum = 0;
            foreach (string p1 in wordpair1)
            { 
                foreach(string p2 in wordpair2)
                {
                    if(p1 == p2)
                    {
                        sameNum++;
                        wordpair2.Remove(p2);
                        break;
                    }
                }
            }
            return (2 * sameNum) / union;
        }
    }
}