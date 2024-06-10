using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SoftwareSystemOrders.Model
{
	public enum OrderStatus
	{
		Pending,
		Delivered,
		Canceled
	}
	public class Order
	{
		public int Id { get; set; }
		public Customer? Customer { get; set; }
		public int CustomerId { get; set; }
		public DateTime Date { get; set; }
		public OrderItem? Item { get; set; }
		public double TotalPrice { get; set; }
		public OrderStatus Status { get; set; }

	}
}
