using SoftwareSystemOrders.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace SoftwareSystemOrders.Helpers
{
	public static class StorageHelper
	{
		private static string filePath = Path.Combine(FileSystem.AppDataDirectory, "orders.json");
		private static string FilePath => Path.Combine(FileSystem.AppDataDirectory, "products.json");


		public static async Task SaveOrdersAsync(List<Order> orders)
		{
			var jsonString = JsonSerializer.Serialize(orders);
			await File.WriteAllTextAsync(filePath, jsonString);
		}

		public static async Task<List<Order>> LoadOrdersAsync()
		{
			if (!File.Exists(filePath))
				return new List<Order>();

			var jsonString = await File.ReadAllTextAsync(filePath);
			return JsonSerializer.Deserialize<List<Order>>(jsonString) ?? new List<Order>();
		}

		public static async Task SaveProductsAsync(IEnumerable<Product> products)
		{
			var options = new JsonSerializerOptions { WriteIndented = true };
			string json = JsonSerializer.Serialize(products, options);
			await File.WriteAllTextAsync(FilePath, json);
		}

		public static async Task<List<Product>> LoadProductsAsync()
		{
			if (File.Exists(FilePath))
			{
				string json = await File.ReadAllTextAsync(FilePath);
				return JsonSerializer.Deserialize<List<Product>>(json) ?? new List<Product>();
			}
			return new List<Product>();
		}
	}
}
