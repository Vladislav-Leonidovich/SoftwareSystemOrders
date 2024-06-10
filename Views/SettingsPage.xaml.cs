using System.Globalization;
using Microsoft.Maui.Storage;
using System.Resources;
using System.Windows.Input;
namespace SoftwareSystemOrders.Views;

public partial class SettingsPage : ContentPage
{
	private readonly ResourceManager _resourceManager;
	private bool _firstSelectionDone = false;
	public SettingsPage()
	{
		_resourceManager = new ResourceManager("SoftwareSystemOrders.Resources.Localization.Resources", typeof(SettingsPage).Assembly);

		InitializeComponent();
		InitializeLanguageSelection();
	}

	private async void OnSiteClicked(object sender, EventArgs e)
	{
		var url = "https://github.com/Vladislav-Leonidovich";
		await Launcher.OpenAsync(url);
	}

	private async Task InitializeLanguageSelection()
	{
		var currentLanguage = Preferences.Get("SelectedLanguage", "en");
		LanguagePicker.SelectedIndex = currentLanguage == "en" ? 0 : 1;
		_firstSelectionDone = true;
	}

	private async void LanguagePicker_SelectedIndexChanged(object sender, EventArgs e)
	{
		if (!_firstSelectionDone)
		{
			_firstSelectionDone = true;
			return;
		}
		var language = LanguagePicker.SelectedIndex == 0 ? "en" : "uk-UA";
		Preferences.Set("SelectedLanguage", language);
		await ApplyLanguageChange(language);
	}

	private async Task ApplyLanguageChange(string language)
	{
		CultureInfo newCulture = new CultureInfo(language == "en" ? "en" : "uk-UA");
		CultureInfo.CurrentCulture = newCulture;
		CultureInfo.CurrentUICulture = newCulture;

		Thread.CurrentThread.CurrentCulture = newCulture;
		Thread.CurrentThread.CurrentUICulture = newCulture;

		string changeLanguageMessage = _resourceManager.GetString("ChangeLanguage", CultureInfo.CurrentUICulture);
		string attentionMessage = _resourceManager.GetString("AttentionMessage", CultureInfo.CurrentUICulture);
		await DisplayAlert(attentionMessage, changeLanguageMessage, "OK");
	}


}