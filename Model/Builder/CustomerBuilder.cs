using Microsoft.Maui.ApplicationModel.Communication;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Microsoft.Maui.ApplicationModel.Permissions;

namespace SoftwareSystemOrders.Model.Builder
{
	public class CustomerBuilder
	{
		private Customer customer = new Customer();
		private static int lastId;

		static CustomerBuilder()
		{
			lastId = Preferences.Get("lastCustomerId", 100);
		}

		public Customer Build ()
		{
			customer.Id = ++lastId;
			Preferences.Set("lastCustomerId", lastId);
			return customer;
		}

		public CustomerBuilder SetName(string name)
		{
			customer.Name = name;
			return this;
		}

		public CustomerBuilder SetEmail(string email)
		{
			customer.Email = email;
			return this;
		}

		public CustomerBuilder SetPhone(string phone)
		{
			customer.Phone = phone;
			return this;
		}
	}
}
