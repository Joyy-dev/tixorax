import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: const TextSpan(
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
            children: [
              TextSpan(
                text: 'Launch your\n',
                style: TextStyle(color: Colors.white),
              ),
              TextSpan(
                text: 'next event',
                style: TextStyle(color: Color(0xFF4EE2D1)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Fill in the core details of your experience.\nHigh-quality visuals and clear descriptions\ndrive higher conversion.',
          style: TextStyle(
            color: Colors.white54,
            fontSize: 14,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}