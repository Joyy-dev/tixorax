import 'package:flutter/material.dart';

class SalesCard extends StatelessWidget {
  const SalesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E1332),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color.fromARGB(15, 255, 255, 255)),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
             padding: const EdgeInsets.all(8),
             decoration: BoxDecoration(
               color: const Color(0xFF3B2561),
               borderRadius: BorderRadius.circular(10),
             ),
             child: const Icon(Icons.bar_chart, color: Color(0xFF4EE2D1), size: 16),
          ),
          const Spacer(),
          const Text(
            'TOTAL SALES', 
            style: TextStyle(
              color: Colors.white54, 
              fontSize: 8, 
              fontWeight: FontWeight.bold, 
              letterSpacing: 1
            )
          ),
          const SizedBox(height: 4),
          const Text('\$12.8k', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}