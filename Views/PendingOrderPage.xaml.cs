using Microsoft.Extensions.DependencyInjection;
using Microsoft.Maui;
using SoftwareSystemOrders.Services;
using SoftwareSystemOrders.ViewModel;
using SoftwareSystemOrders.Model;


namespace SoftwareSystemOrders.Views;

public partial class PendingOrderPage : ContentPage
{
	public PendingOrderPage()
	{
		InitializeComponent();

		BindingContext = new PendingOrderViewModel(App.DataService);
	}

	private async void OnSelectionChanged(object sender, SelectionChangedEventArgs e)
	{
		var selectedOrder = e.CurrentSelection.FirstOrDefault() as Order;
		if (OrdersCollectionView.SelectedItem != null)
		{
			var detailsPage = new OrderDetailsPage(true);
			(detailsPage.BindingContext as OrderDetailsViewModel).SelectedOrder = selectedOrder;
			await Navigation.PushAsync(detailsPage);
		}
		OrdersCollectionView.SelectedItem = null;
	}
}