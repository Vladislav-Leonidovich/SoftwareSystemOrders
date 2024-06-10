using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SoftwareSystemOrders.Model.Builder
{
    public class OrderBuilder
    {
        private Order order = new Order();
		private static int lastId;

		static OrderBuilder() 
		{
			lastId = Preferences.Get("lastOrderId", 1000);
		}

		public Order Build()
        {
            order.Id = SetId();
            order.Date = SetDate();
            order.Status = OrderStatus.Pending;
            return order;
        }

		private DateTime SetDate()
		{
			return DateTime.Now;
		}

		private int SetId()
		{
			lastId += 5;
			Preferences.Set("lastOrderId", lastId);
			return lastId;
		}

		public OrderBuilder SetStatus(OrderStatus orderStatus) { order.Status = orderStatus; return this; }

		public OrderBuilder SetCustomer(Customer customer)
        {
			order.Customer = customer;
			order.CustomerId = customer.Id;
			return this;
		}

		public OrderBuilder SetOrderItem(OrderItem orderItem)
		{
			order.Item = orderItem;
			return this;
		}

        public OrderBuilder GetTotalPrice(OrderItem orderItem)
        {
            order.TotalPrice = orderItem.Quantity * orderItem.Price;
			return this;
		}
    }
}
