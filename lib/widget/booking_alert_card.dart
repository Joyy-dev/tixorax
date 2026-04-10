import 'package:flutter/material.dart';

class BookingAlertCard extends StatelessWidget {
  const BookingAlertCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E1332),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color.fromARGB(19, 255, 255, 255)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Container(
             padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
             decoration: BoxDecoration(
               color: const Color.fromARGB(41, 240, 123, 150),
               borderRadius: BorderRadius.circular(6),
             ),
             child: const Icon(Icons.local_activity, color: Color(0xFFF07B96), size: 14),
          ),
          const SizedBox(width: 12),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('New booking alert', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
              SizedBox(height: 2),
              Text('Just now', style: TextStyle(color: Colors.white54, fontSize: 10)),
            ],
          )
        ],
      ),
    );
  }
}