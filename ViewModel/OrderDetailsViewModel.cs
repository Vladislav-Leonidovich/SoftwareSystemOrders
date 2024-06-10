using SoftwareSystemOrders.Model;
using SoftwareSystemOrders.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace SoftwareSystemOrders.ViewModel
{
	public class OrderDetailsViewModel : BaseOrderViewModel
	{
		public ICommand ChangeOrderStatusCommand {  get; set; }
		public OrderDetailsViewModel(IDataService dataService) : base(dataService)
		{
			ChangeOrderStatusCommand = new Command<OrderStatus>(async (status) => await ChangeOrderStatus(status));
		}

		public async Task ChangeOrderStatus(OrderStatus newStatus)
		{
			if (SelectedOrder != null)
			{
				SelectedOrder.Status = newStatus;
				await DataService.SaveOrderAsync(SelectedOrder);
				SelectedOrder = null;
			}
		}
	}
}
