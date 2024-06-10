using SoftwareSystemOrders.Services;
using SoftwareSystemOrders.ViewModel;
using Microsoft.Extensions.DependencyInjection;
using System.Text.RegularExpressions;

namespace SoftwareSystemOrders.Views;

public partial class CreateOrderPage : ContentPage
{
	public CreateOrderPage()
	{
		InitializeComponent();
		BindingContext = new CreateOrderViewModel(App.DataService);
	}

	private void Entry_Unfocused(object sender, FocusEventArgs e)
	{
		if (sender is Entry entry)
		{
			string text = entry.Text;
			string processedText;
			if (!string.IsNullOrEmpty(text))
			{
				processedText = Regex.Replace(text.Trim(), @"\s+", " ");
				entry.Text = processedText;
			}
		}
	}

	private void OnPhoneTextChanged(object sender, TextChangedEventArgs e)
	{
		var entry = sender as Entry;
		if (entry == null) return;

		// Фильтрация ввода, оставляем только цифры
		entry.Text = Regex.Replace(e.NewTextValue ?? "", "[^0-9]", "");
	}
}