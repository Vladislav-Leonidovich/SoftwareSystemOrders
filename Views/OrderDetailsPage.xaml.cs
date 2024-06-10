using SoftwareSystemOrders.ViewModel;
using SoftwareSystemOrders.Model;
using System.Globalization;
using System.Resources;
namespace SoftwareSystemOrders.Views;
public partial class OrderDetailsPage : ContentPage
{
	public OrderDetailsPage(bool showButtons)
	{
		InitializeComponent();
		BindingContext = new OrderDetailsViewModel(App.DataService);

		CancelButton.IsVisible = showButtons;
		CompleteButton.IsVisible = showButtons;

		DetailsGrid.SizeChanged += OnDetailsGridSizeChanged;
	}
	private async void OnCancelOrderClicked(object sender, EventArgs e)
	{
		await DisplayLocalizedAlert("OrderCanceled");
	}

	private async void OnCompleteOrderClicked(object sender, EventArgs e)
	{
		await DisplayLocalizedAlert("OrderConfirmed");
	}

	private async Task DisplayLocalizedAlert(string resourceKey)
	{
		var viewModel = BindingContext as BaseOrderViewModel;
		string title = viewModel.ResourceManager.GetString("OrderStatus", CultureInfo.CurrentCulture);
		string message = viewModel.ResourceManager.GetString(resourceKey, CultureInfo.CurrentCulture);
		await DisplayAlert(title, message, "OK");
		await Navigation.PopAsync();
	}

	private void OnDetailsGridSizeChanged(object sender, EventArgs e)
	{
		var gridWidth = DetailsGrid.Width;

		if (gridWidth < 600)
		{
			DetailsGrid.ColumnDefinitions.Clear();
			DetailsGrid.ColumnDefinitions.Add(new ColumnDefinition { Width = GridLength.Star });

			DetailsGrid.RowDefinitions.Clear();
			DetailsGrid.RowDefinitions.Add(new RowDefinition { Height = GridLength.Auto });
			DetailsGrid.RowDefinitions.Add(new RowDefinition { Height = GridLength.Star });

			Grid.SetRow(detailsLayout, 1);
			Grid.SetColumn(detailsLayout, 0);
			Grid.SetColumnSpan(detailsLayout, 1);
		}
		else
		{
			DetailsGrid.ColumnDefinitions.Clear();
			DetailsGrid.ColumnDefinitions.Add(new ColumnDefinition { Width = GridLength.Auto });
			DetailsGrid.ColumnDefinitions.Add(new ColumnDefinition { Width = GridLength.Star });

			DetailsGrid.RowDefinitions.Clear();
			DetailsGrid.RowDefinitions.Add(new RowDefinition { Height = GridLength.Auto });

			Grid.SetRow(detailsLayout, 0);
			Grid.SetColumn(detailsLayout, 1);
			Grid.SetColumnSpan(detailsLayout, 1);
		}
	}
}