using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SoftwareSystemOrders.Model;
using SoftwareSystemOrders.Helpers;
using SoftwareSystemOrders.Model.Builder;

namespace SoftwareSystemOrders.Services
{

    public interface IDataService
    {
		ObservableCollection<Product> Products { get; }
		ObservableCollection<Order> Orders { get; }

		public event Action<Order> OrderStatusChanged;
		async Task AddOrderAsync(Order order) { }
		async Task RemoveOrderAsync(Order order) { }
		async Task SaveOrderAsync(Order order) {  }
		async Task AddProductAsync(Product product) { }
		async Task RemoveProductAsync(Product product) { }
	}

    internal class DataService : IDataService
    {
		public ObservableCollection<Product> Products { get; } = new ObservableCollection<Product>();
		public ObservableCollection<Order> Orders { get; } = new ObservableCollection<Order>();

		public DataService()
        {
			InitializeDataAsync();
		}

        private async Task InitializeProductsAsync()
        {
			Products.Add(new ProductBuilder().SetName("Headphones Hator").SetDescription("Description Hator").SetImageUrl("hypergangwirelesstrimode.png").SetPrice(1700).SetQuantity(100).Build());
			Products.Add(new ProductBuilder().SetName("Keyboard Aula").SetDescription("Description Aula").SetImageUrl("aulakeyboard.png").SetPrice(1100).SetQuantity(100).Build());
			Products.Add(new ProductBuilder().SetName("Microphone Fifine").SetDescription("Description Fifine").SetImageUrl("fifine.png").SetPrice(700).SetQuantity(100).Build());
			Products.Add(new ProductBuilder().SetName("Mouse Hator").SetDescription("Description Hator").SetImageUrl("mousehator.png").SetPrice(500).SetQuantity(100).Build());
			Products.Add(new ProductBuilder().SetName("Headphones MSI").SetDescription("Description MSI").SetImageUrl("headphonesmsi.png").SetPrice(1500).SetQuantity(100).Build());
			Products.Add(new ProductBuilder().SetName("Keyboard A4Tech").SetDescription("Description A4Tech").SetImageUrl("a4techkeyboard.png").SetPrice(1000).SetQuantity(100).Build());
			Products.Add(new ProductBuilder().SetName("Mouse G102").SetDescription("Description G102").SetImageUrl("g102mouse.png").SetPrice(1300).SetQuantity(100).Build());
			Products.Add(new ProductBuilder().SetName("Headphones HyperX").SetDescription("Description HyperX").SetImageUrl("hyperxcloudgamingheadset.png").SetPrice(2500).SetQuantity(100).Build());
			await StorageHelper.SaveProductsAsync(Products.ToList());
		}

		public async Task InitializeDataAsync()
		{
			var storedOrders = await StorageHelper.LoadOrdersAsync();
			foreach (var order in storedOrders)
			{
				Orders.Add(order);
			}

			var storedProducts = await StorageHelper.LoadProductsAsync();
			if (storedProducts.Count == 0)
			{
				InitializeProductsAsync();
			}

			foreach (var product in storedProducts)
			{
				Products.Add(product);
			}
		}

		private async void Order_PropertyChanged(object sender, PropertyChangedEventArgs e)
		{
			if (e.PropertyName == nameof(Order.Status))
			{
				Order order = sender as Order;
				await StorageHelper.SaveOrdersAsync(Orders.ToList());
				NotifyOrderStatusChanged(order);
			}
		}

		public event Action<Order> OrderStatusChanged;

		protected virtual void NotifyOrderStatusChanged(Order order)
		{
			OrderStatusChanged?.Invoke(order);
		}

		public async Task AddOrderAsync(Order order)
		{
			if (order == null)
				throw new ArgumentNullException(nameof(order));

			Orders.Add(order);
			await StorageHelper.SaveOrdersAsync(Orders.ToList());
		}

		public async Task RemoveOrderAsync(Order order)
		{
			if (order == null)
				throw new ArgumentNullException(nameof(order));

			Orders.Remove(order);
			await StorageHelper.SaveOrdersAsync(Orders.ToList());
		}

		public async Task SaveOrderAsync(Order order)
		{
			if (order == null)
				throw new ArgumentNullException(nameof(order));

			await RemoveOrderAsync(order);
			await AddOrderAsync(order);
			await StorageHelper.SaveOrdersAsync(Orders.ToList());
		}

		public async Task AddProductAsync(Product product)
		{
			if (product == null)
				throw new ArgumentNullException(nameof(product));

			Products.Add(product);
			await StorageHelper.SaveProductsAsync(Products.ToList());
		}

		public async Task RemoveProductAsync(Product product)
		{
			if (product == null)
				throw new ArgumentNullException(nameof(product));

			Products.Remove(product);
			await StorageHelper.SaveProductsAsync(Products.ToList());
		}
	}
}
