namespace SportShop.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Chitiethoadon")]
    public partial class Chitiethoadon
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int HoadonID { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ProductID { get; set; }

        public int Soluong { get; set; }

        public float Giagoc { get; set; }

        public float Giadaban { get; set; }

        public virtual Hoadon Hoadon { get; set; }

        public virtual Product Product { get; set; }
    }
}
