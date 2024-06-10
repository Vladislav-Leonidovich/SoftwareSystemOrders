using Microsoft.Maui.Controls;
using SoftwareSystemOrders.Model;
using SoftwareSystemOrders.Model.Builder;
using SoftwareSystemOrders.Services;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Collections.Specialized;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace SoftwareSystemOrders.ViewModel
{
	public class PendingOrderViewModel : BaseOrderViewModel
	{
		public ObservableCollection<Order> PendingOrders { get; private set; } = new ObservableCollection<Order>();
		public ICommand DeleteAllOrdersCommand { get; set; }


		public PendingOrderViewModel(IDataService dataService) : base(dataService)
		{
			DeleteAllOrdersCommand = new Command(async () => await DeleteAllOrdersAsync());

			DataService.Orders.CollectionChanged += Orders_CollectionChanged;
			UpdatePendingOrders();
		}

		private void UpdatePendingOrders()
		{
			var currentIds = new HashSet<int>(PendingOrders.Select(o => o.Id));
			var updatedOrders = DataService.Orders.Where(o => o.Status == OrderStatus.Pending).ToList();

			foreach (var order in PendingOrders.ToList())
			{
				if (!updatedOrders.Any(o => o.Id == order.Id))
					PendingOrders.Remove(order);
			}

			foreach (var order in updatedOrders)
			{
				if (!currentIds.Contains(order.Id))
					PendingOrders.Add(order);
			}
			OnPropertyChanged(nameof(PendingOrders));
		}

		private void Orders_CollectionChanged(object sender, NotifyCollectionChangedEventArgs e)
		{
			UpdatePendingOrders();
		}

		private async Task DeleteAllOrdersAsync()
		{
			var pendingOrders = DataService.Orders.Where(o => o.Status == OrderStatus.Pending).ToList();
			foreach (var order in pendingOrders)
			{
				await DataService.RemoveOrderAsync(order);
			}
			OnPropertyChanged(nameof(PendingOrders));
		}

	}
}
