//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CPS_Solution.EntityFramework
{
    using System;
    using System.Collections.Generic;
    
    public partial class ParseInfo
    {
        public int ID { get; set; }
        public string Parselink { get; set; }
        public string Name { get; set; }
        public string CPUXPath { get; set; }
        public string RAMXPath { get; set; }
        public string VGAXPath { get; set; }
        public string HDDXPath { get; set; }
        public string DisplayXPath { get; set; }
        public bool IsActive { get; set; }
    }
}