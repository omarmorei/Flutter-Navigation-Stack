import 'package:flutter/material.dart';
import 'product_details_screen.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  final List<String> products = const [
    "Laptop",
    "Phone",
    "Headphones"
  ];

  /// 🔹 أيقونات مختلفة حسب المنتج
  IconData _getIcon(String name) {
    switch (name) {
      case "Laptop":
        return Icons.laptop_mac;
      case "Phone":
        return Icons.smartphone;
      case "Headphones":
        return Icons.headphones;
      default:
        return Icons.devices;
    }
  }

  /// 🔹 ألوان مختلفة لكل عنصر
  Color _getColor(String name) {
    switch (name) {
      case "Laptop":
        return Colors.deepPurple;
      case "Phone":
        return Colors.teal;
      case "Headphones":
        return Colors.orange;
      default:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA), // خلفية ناعمة
      appBar: AppBar(
        title: const Text("🛍 Products"),
        backgroundColor: Colors.indigo,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          final color = _getColor(product);

          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),

              /// 🔹 الأيقونة
              leading: CircleAvatar(
                backgroundColor: color.withOpacity(0.15),
                child: Icon(
                  _getIcon(product),
                  color: color,
                ),
              ),

              /// 🔹 اسم المنتج
              title: Text(
                product,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),

              /// 🔹 السهم
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),

              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductDetailsScreen(
                      productName: product,
                    ),
                  ),
                );

                if (result != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(result),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: color, // نفس لون المنتج
                    ),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}