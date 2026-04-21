import 'package:flutter/material.dart';
import 'detail_screen.dart';
import 'product_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _navigate(BuildContext context, Widget page) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, _, _) => page,
        transitionsBuilder: (_, anim, _, child) {
          return SlideTransition(
            position: Tween(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(anim),
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1D2671), Color(0xFFC33764)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// 🔹 عنوان الصفحة
                const Text(
                  "Welcome 👋",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Choose what you want to explore",
                  style: TextStyle(color: Colors.white70),
                ),

                const SizedBox(height: 40),

                /// 🔹 كارت التفاصيل
                _card(
                  context,
                  title: "Go to Details",
                  icon: Icons.info,
                  color: Colors.deepPurple,
                  page: const DetailScreen(),
                ),

                const SizedBox(height: 20),

                /// 🔹 كارت المنتجات
                _card(
                  context,
                  title: "View Products",
                  icon: Icons.shopping_cart,
                  color: Colors.blueAccent,
                  page: const ProductListScreen(),
                ),

                const Spacer(),

                /// 🔹 أيقونة Flutter في الأسفل
                Center(
                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white24,
                    child: const Icon(
                      Icons.flutter_dash,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _card(BuildContext context,
      {required String title,
      required IconData icon,
      required Color color,
      required Widget page}) {
    return InkWell(
      onTap: () => _navigate(context, page),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color.withOpacity(0.9),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.5),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 30),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.white),
          ],
        ),
      ),
    );
  }
}