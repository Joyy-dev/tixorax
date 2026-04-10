import 'package:flutter/material.dart';

class PlusCard extends StatelessWidget {
  const PlusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1A112C),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white12),
      ),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
               BoxShadow(
                 color: Colors.white24,
                 blurRadius: 10,
                 spreadRadius: 2,
               )
            ]
          ),
          child: const Icon(Icons.add, color: Color(0xFF1A112C), size: 24)
        ),
      ),
    );
  }
}