using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SoftwareSystemOrders.Services;

namespace SoftwareSystemOrders.Model.Builder
{
    public class OrderItemBuilder
    {
        private OrderItem orderItem = new OrderItem();

        public OrderItem Build()
        {
            return orderItem;
        }

        public OrderItemBuilder SetProduct(Product product)
        {
			orderItem.Product = product;
			orderItem.ProductId = product.Id;
			orderItem.Price = product.Price;
            return this;
		}

        public OrderItemBuilder SetQuantity(int quantity)
        {
            orderItem.Quantity = quantity;
			return this;
		}
    }
}
