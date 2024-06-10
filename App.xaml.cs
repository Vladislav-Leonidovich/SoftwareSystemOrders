using Microsoft.Maui.Controls;
using SoftwareSystemOrders.Services;
using System.Globalization;
namespace SoftwareSystemOrders
{
	public partial class App : Application
	{
		public static IDataService DataService { get; private set; }
		public App(IServiceProvider serviceProvider)
		{
			InitializeComponent();
			DataService = serviceProvider.GetService<IDataService>();
			SetLanguage();
			MainPage = new AppShell();
		}


		private void SetLanguage()
		{
			string savedLanguage = Preferences.Get("SelectedLanguage", "en");
			CultureInfo.CurrentCulture = new CultureInfo(savedLanguage);
			CultureInfo.CurrentUICulture = new CultureInfo(savedLanguage);
		}
	}
}
