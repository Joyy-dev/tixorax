import 'package:flutter/material.dart';
import 'package:tixora/widget/build_icon_button.dart';

class HeaderImage extends StatelessWidget {
  const HeaderImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 350,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xFF1E1436),
            image: DecorationImage(
              image: AssetImage('assets/images/concert.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  const Color(0xFF0D061E).withOpacity(0.8),
                  const Color(0xFF0D061E),
                ],
                stops: const [0.6, 0.9, 1.0],
              ),
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BuildIconButton(Icons.arrow_back, () {
                  Navigator.pop(context);
                }),
                Row(
                  children: [
                    BuildIconButton(Icons.favorite_border, () {}),
                    const SizedBox(width: 12),
                    BuildIconButton(Icons.share, () {}),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 24,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFFFAFA2),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              'ELECTRONIC / LIVE',
              style: TextStyle(
                color: Color(0xFF0D061E),
                fontSize: 10,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}