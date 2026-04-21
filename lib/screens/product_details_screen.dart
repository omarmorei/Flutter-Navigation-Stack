import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String productName;

  const ProductDetailsScreen({super.key, required this.productName});

  /// 🔹 لون مختلف حسب المنتج
  Color _getColor() {
    switch (productName) {
      case "Laptop":
        return Colors.deepPurple;
      case "Phone":
        return Colors.teal;
      case "Headphones":
        return Colors.orange;
      default:
        return Colors.indigo;
    }
  }

  /// 🔹 أيقونة مختلفة حسب المنتج
  IconData _getIcon() {
    switch (productName) {
      case "Laptop":
        return Icons.laptop_mac;
      case "Phone":
        return Icons.smartphone;
      case "Headphones":
        return Icons.headphones;
      default:
        return Icons.shopping_cart;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _getColor();

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
        title: Text(productName),
        backgroundColor: color,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            /// 🔹 الأيقونة (تحسين اللون بدل Gradient)
            Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color.withOpacity(0.15),
              ),
              child: Icon(
                _getIcon(),
                size: 70,
                color: color,
              ),
            ),

            const SizedBox(height: 25),

            /// 🔹 اسم المنتج
            Text(
              productName,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 30),

            /// 🔹 زر مفضل (محسن)
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                padding: const EdgeInsets.symmetric(
                    horizontal: 30, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.pop(context, "Added to favorites ✅");
              },
              icon: const Icon(Icons.favorite_border),
              label: const Text("Add to Favorites"),
            ),
          ],
        ),
      ),
    );
  }
}