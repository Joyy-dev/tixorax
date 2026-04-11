import 'package:flutter/material.dart';

class CoverPost extends StatelessWidget {
  const CoverPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40),
      decoration: BoxDecoration(
        color: const Color(0xFF261D42),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.white12,
          width: 1.5,
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color(0xFF1E1436),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.camera_alt,
              color: Color(0xFF9B7EED),
              size: 32,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Cover Poster',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'RECOMMENDED: 1080 X 1440PX',
            style: TextStyle(
              color: Colors.white38,
              fontSize: 10,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF33255B),
              foregroundColor: Color(0xFFB5A1FF)
            ),
            onPressed: () {}, 
            child: Text(
              'Select File'
            )
          ),
        ],
      ),
    );
  }
}