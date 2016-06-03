namespace SportShop.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Product")]
    public partial class Product
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Product()
        {
            Chitiethoadons = new HashSet<Chitiethoadon>();
            Images = new HashSet<Image>();
        }

        public int ProductID { get; set; }

        [Required]
        [StringLength(50)]
        public string ProductName { get; set; }

        public int TypeID { get; set; }

        public int CategoryID { get; set; }

        public int BrandID { get; set; }

        public int ColorID { get; set; }

        public int SaleID { get; set; }

        public int SizeID { get; set; }

        public float Price { get; set; }

        public string Description { get; set; }

        public bool? IsNew { get; set; }

        public int? Rating { get; set; }

        [Required]
        [StringLength(100)]
        public string Avatar { get; set; }

        public virtual Brand Brand { get; set; }

        public virtual Category Category { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Chitiethoadon> Chitiethoadons { get; set; }

        public virtual Color Color { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Image> Images { get; set; }

        public virtual Sale Sale { get; set; }

        public virtual Size Size { get; set; }

        public virtual ShoeType ShoeType { get; set; }
    }
}
