//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace VivoosVR
{
    using System;
    using System.Collections.Generic;
    
    public partial class ConsumerProperty
    {
        public System.Guid Id { get; set; }
        public System.Guid ConsumerId { get; set; }
        public string Value { get; set; }
        public bool Available { get; set; }
        public System.DateTime EntryDate { get; set; }
        public int TypeNo { get; set; }
    
        public virtual ConsumerPropertyType ConsumerPropertyType { get; set; }
        public virtual Consumer Consumer { get; set; }
    }
}
