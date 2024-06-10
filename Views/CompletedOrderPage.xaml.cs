using SoftwareSystemOrders.ViewModel;
using SoftwareSystemOrders.Model;
namespace SoftwareSystemOrders.Views;

public partial class CompletedOrderPage : ContentPage
{
	public CompletedOrderPage()
	{
		InitializeComponent();

		BindingContext = new CompletedOrderViewModel(App.DataService);
	}

	private async void OnSelectionChanged(object sender, SelectionChangedEventArgs e)
	{
		var selectedOrder = e.CurrentSelection.FirstOrDefault() as Order;
		if (OrdersCollectionView.SelectedItem != null)
		{
			var detailsPage = new OrderDetailsPage(false);
			(detailsPage.BindingContext as OrderDetailsViewModel).SelectedOrder = selectedOrder;
			// Переход на страницу деталей заказа
			await Navigation.PushAsync(detailsPage);
		}
		OrdersCollectionView.SelectedItem = null;
	}
}