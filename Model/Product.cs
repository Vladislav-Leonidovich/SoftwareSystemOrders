﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SoftwareSystemOrders.Model
{
	public class Product
	{
		public int Id { get; set; }
		public string? Name { get; set; }
		public string? Description { get; set; }
		public string? ImageUrl { get; set; }
		public int Quantity { get; set; }
		public double Price { get; set; }
	}
}
