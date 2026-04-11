import 'package:flutter/material.dart';

class StepColumn extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isActive;

  const StepColumn(this.label, this.icon, {required this.isActive, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFF160D26) : const Color(0xFF1E1436),
            shape: BoxShape.circle,
            border: Border.all(
              color: isActive ? const Color(0xFF4EE2D1) : Colors.transparent,
              width: 2,
            ),
          ),
          child: Icon(
            icon,
            color: isActive ? const Color(0xFF4EE2D1) : Colors.white38,
            size: 18,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: isActive ? const Color(0xFF4EE2D1) : Colors.white38,
            fontSize: 10,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
          ),
        ),
      ],
    );
  }
}