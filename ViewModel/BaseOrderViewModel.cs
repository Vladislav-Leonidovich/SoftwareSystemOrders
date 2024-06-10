using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections.ObjectModel;
using System.Windows.Input;
using SoftwareSystemOrders.Model;
using SoftwareSystemOrders.Services;
using System.Resources;
using SoftwareSystemOrders.Model.Builder;
using System.Globalization;
using System.Text.RegularExpressions;

namespace SoftwareSystemOrders.ViewModel
{
	public class BaseOrderViewModel : INotifyPropertyChanged
	{
		private ResourceManager _resourceManager;
		public ResourceManager ResourceManager
		{
			get { return _resourceManager; }
			protected set { _resourceManager = value; }
		}

		protected IDataService _dataService;
		public IDataService DataService
		{ 
			get { return _dataService; }
			set
			{
				_dataService = value;
			}
		}

		private Customer _selectedCustomer;
		public Customer SelectedCustomer
		{
			get { return _selectedCustomer; }
			set
			{
				_selectedCustomer = value;
				OnPropertyChanged(nameof(SelectedCustomer));
			}
		}

		private Product _selectedProduct;
		public Product SelectedProduct
		{
			get { return _selectedProduct; }
			set
			{
				_selectedProduct = value;
				OnPropertyChanged(nameof(SelectedProduct));
			}
		}
		private Order? _selectedOrder;
		public Order? SelectedOrder
		{
			get { return _selectedOrder; }
			set
			{
				if (_selectedOrder != value)
				{
					_selectedOrder = value;
					OnPropertyChanged(nameof(SelectedOrder));
					OnPropertyChanged(nameof(LocalizedOrderStatus));
				}
			}
		}

		private int _quantity = 1;
		public int Quantity
		{
			get { return _quantity; }
			set
			{
				if (value < 1)
				{
					_quantity = 1;
				}
				else
				{
					_quantity = value;
				}

				OnPropertyChanged(nameof(Quantity));
			}
		}
		public BaseOrderViewModel(IDataService dataService)
		{
			DataService = dataService;
			ResourceManager = new ResourceManager("SoftwareSystemOrders.Resources.Localization.Resources", typeof(BaseOrderViewModel).Assembly);
		}

		public string GetLocalizedOrderStatus(OrderStatus status)
		{
			string resourceName = $"OrderStatus_{status}";
			return ResourceManager.GetString(resourceName, CultureInfo.CurrentCulture);
		}
		public string LocalizedOrderStatus => GetLocalizedOrderStatus(SelectedOrder?.Status ?? OrderStatus.Pending);


		public event PropertyChangedEventHandler PropertyChanged;
		protected void OnPropertyChanged(string propertyName)
		{
			PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
		}
	}
}
