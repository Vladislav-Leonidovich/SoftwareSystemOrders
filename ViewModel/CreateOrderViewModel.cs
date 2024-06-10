
using Microsoft.Maui.Controls;
using SoftwareSystemOrders.Model;
using SoftwareSystemOrders.Model.Builder;
using SoftwareSystemOrders.Services;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Globalization;
using System.Linq;
using System.Resources;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Input;

namespace SoftwareSystemOrders.ViewModel
{
	public class CreateOrderViewModel : BaseOrderViewModel
	{
		public ICommand AddOrderCommand { get; set; }
		public ICommand IncreaseCommand => new Command(IncreaseQuantity);
		public ICommand DecreaseCommand => new Command(DecreaseQuantity);

		private string _newCustomerName;
		public string NewCustomerName
		{
			get => _newCustomerName;
			set
			{
				if (SetProperty(ref _newCustomerName, value))
				{
					ValidateCustomerName(value);
				}
			}
		}

		private void ValidateCustomerName(string name)
		{
			CustomerNameError = string.IsNullOrWhiteSpace(name) ? ResourceManager.GetString("CustomerNameError", CultureInfo.CurrentCulture) : "";
		}

		private string _newCustomerEmail;
		public string NewCustomerEmail
		{
			get => _newCustomerEmail;
			set
			{
				if (SetProperty(ref _newCustomerEmail, value))
				{
					ValidateCustomerEmail(value);
				}
			}
		}

		private void ValidateCustomerEmail(string email)
		{
			CustomerEmailError = string.IsNullOrWhiteSpace(email) || !email.Contains("@") ? ResourceManager.GetString("CustomerEmailError", CultureInfo.CurrentCulture) : "";
		}

		private string _newCustomerPhone;
		public string NewCustomerPhone
		{
			get => _newCustomerPhone;
			set
			{
				var numericOnly = Regex.Replace(value ?? "", "[^0-9]", "");
				if (SetProperty(ref _newCustomerPhone, numericOnly))
				{
					ValidateCustomerPhone(numericOnly);
				}
			}
		}

		private void ValidateCustomerPhone(string phone)
		{
			CustomerPhoneError = string.IsNullOrWhiteSpace(phone) || phone.Length < 10 ? ResourceManager.GetString("CustomerPhoneError", CultureInfo.CurrentCulture) : "";
		}

		private bool SetProperty<T>(ref T backingStore, T value, [System.Runtime.CompilerServices.CallerMemberName] string propertyName = "")
		{
			if (EqualityComparer<T>.Default.Equals(backingStore, value))
				return false;

			backingStore = value;
			OnPropertyChanged(propertyName);
			return true;
		}

		private string _customerNameError;
		public string CustomerNameError
		{
			get => _customerNameError;
			protected set
			{
				_customerNameError = value;
				OnPropertyChanged(nameof(CustomerNameError));
			}
		}

		private string _customerEmailError;
		public string CustomerEmailError
		{
			get => _customerEmailError;
			protected set
			{
				_customerEmailError = value;
				OnPropertyChanged(nameof(CustomerEmailError));
			}
		}

		private string _customerPhoneError;
		public string CustomerPhoneError
		{
			get => _customerPhoneError;
			protected set
			{
				_customerPhoneError = value;
				OnPropertyChanged(nameof(CustomerPhoneError));
			}
		}

		public CreateOrderViewModel(IDataService dataService) : base(dataService)
		{
			AddOrderCommand = new Command(async () => await AddOrderAsync());
		}


		private Customer AddCustomer()
		{
			var customerBuilder = new CustomerBuilder();
			SelectedCustomer = customerBuilder.SetName(NewCustomerName)
											 .SetEmail(NewCustomerEmail)
											 .SetPhone(NewCustomerPhone)
											 .Build();
			return SelectedCustomer;
		}


		private async Task AddOrderAsync()
		{
			if (!string.IsNullOrEmpty(NewCustomerName) && !string.IsNullOrEmpty(NewCustomerEmail) && !string.IsNullOrEmpty(NewCustomerPhone) && SelectedProduct != null)
			{
				if (string.IsNullOrEmpty(CustomerNameError) && string.IsNullOrEmpty(CustomerEmailError) && string.IsNullOrEmpty(CustomerPhoneError)) 
				{
					var orderBuilder = new OrderBuilder();
					OrderItem newOrderItem;
					var newOrder = orderBuilder.SetCustomer(AddCustomer())
											   .SetOrderItem(newOrderItem = new OrderItemBuilder()
															 .SetProduct(SelectedProduct)
															 .SetQuantity(Quantity)
															 .Build())
											   .GetTotalPrice(newOrderItem)
											   .Build();
					await _dataService.AddOrderAsync(newOrder);
					ClearInputFields();
				}
			}
		}

		private void ClearInputFields()
		{
			NewCustomerName = string.Empty;
			NewCustomerEmail = string.Empty;
			NewCustomerPhone = string.Empty;
			CustomerNameError = string.Empty;
			CustomerEmailError = string.Empty;
			CustomerPhoneError = string.Empty;
		}

		private void IncreaseQuantity()
		{
			Quantity++;
		}

		private void DecreaseQuantity()
		{
			if (Quantity > 0)
				Quantity--;
		}
	}
}
