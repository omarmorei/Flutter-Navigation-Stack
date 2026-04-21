import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA), // لون خلفية مختلف خفيف
      appBar: AppBar(
        title: const Text("Details"),
        backgroundColor: Colors.indigo, // لون جديد
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            /// 🔹 الأيقونة (تغيير لون وشكل)
            Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.indigo.withOpacity(0.15),
              ),
              child: const Icon(
                Icons.info_outline, // أيقونة جديدة
                size: 80,
                color: Colors.indigo,
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "Details Screen",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 30),

            /// 🔹 زر الرجوع (تحسين الشكل)
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 3,
              ),
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios_new),
              label: const Text("Back"),
            ),
          ],
        ),
      ),
    );
  }
}