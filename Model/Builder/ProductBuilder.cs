using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SoftwareSystemOrders.Model.Builder
{
	public class ProductBuilder
	{
		private Product product = new Product();
		private static int lastId = 0;

		public Product Build()
		{ 
			product.Id = ++lastId;
			return product;
		}

		public ProductBuilder SetName(string name = "Product") 
		{ 
			product.Name = name; 
			return this;
		}

		public ProductBuilder SetDescription(string description = "None")
		{
			product.Description = description;
			return this;
		}

		public ProductBuilder SetImageUrl(string imageUrl = "default_image.png")
		{
			product.ImageUrl = imageUrl;
			return this;
		}

		public ProductBuilder SetQuantity(int quantity = 0)
		{
			product.Quantity = quantity;
			return this;
		}

		public ProductBuilder SetPrice(double price = 0)
		{
			product.Price = price;
			return this;
		}
	}
}
