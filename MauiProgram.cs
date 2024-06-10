using Microsoft.Extensions.Logging;
using SoftwareSystemOrders.Services;

namespace SoftwareSystemOrders
{
    public static class MauiProgram
	{
		public static MauiApp CreateMauiApp() 
		{
			var builder = MauiApp.CreateBuilder();
			builder
				.UseMauiApp<App>()
				.ConfigureFonts(fonts =>
				{
					fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
					fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
				});

			builder.Services.AddSingleton<IDataService, DataService>();

#if DEBUG
			builder.Logging.AddDebug();
#endif

			var app = builder.Build();
			return app;
		}
	}
}
