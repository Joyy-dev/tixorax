import 'package:flutter/material.dart';

class BuildIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const BuildIconButton(
    this.icon, this.onPressed, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF160D26).withOpacity(0.7),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white, size: 20),
        onPressed: onPressed,
      ),
    );
  }
}