using SoftwareSystemOrders.Model;
using SoftwareSystemOrders.Services;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Collections.Specialized;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Input;

namespace SoftwareSystemOrders.ViewModel
{
	public class CompletedOrderViewModel : BaseOrderViewModel
	{
		public ObservableCollection<Order> CompletedOrders { get; private set; } = new ObservableCollection<Order>();
		public ICommand DeleteAllOrdersCommand { get; set; }


		public CompletedOrderViewModel(IDataService dataService) : base(dataService)
		{
			DeleteAllOrdersCommand = new Command(async () => await DeleteAllOrdersAsync());
			DataService.Orders.CollectionChanged += Orders_CollectionChanged;
			UpdateCompletedOrders();
		}

		private void Orders_CollectionChanged(object sender, NotifyCollectionChangedEventArgs e)
		{
			UpdateCompletedOrders();
		}

		private void UpdateCompletedOrders()
		{
			var completedOrders = DataService.Orders.Where(o => o.Status == OrderStatus.Delivered || o.Status == OrderStatus.Canceled).ToList();
			CompletedOrders.Clear();
			foreach (var order in completedOrders)
			{
				CompletedOrders.Add(order);
			}
			OnPropertyChanged(nameof(CompletedOrders));
		}
		private async Task DeleteAllOrdersAsync()
		{
			var completedOrders = DataService.Orders.Where(o => o.Status == OrderStatus.Delivered || o.Status == OrderStatus.Canceled).ToList();
			foreach (var order in completedOrders)
			{
				await DataService.RemoveOrderAsync(order);
			}
			OnPropertyChanged(nameof(CompletedOrders));
		}
	}
}
