namespace SportShop.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Image")]
    public partial class Image
    {
        public int ImageID { get; set; }

        public int ProductID { get; set; }

        [Required]
        [StringLength(200)]
        public string LinkImage { get; set; }

        public virtual Product Product { get; set; }
    }
}
