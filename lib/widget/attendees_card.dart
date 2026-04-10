import 'package:flutter/material.dart';

class AttendeesCard extends StatelessWidget {
  const AttendeesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF150A21),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color.fromARGB(10, 255, 255, 255)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          SizedBox(
            width: 40,
            child: Stack(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: const Color(0xFF3B2561),
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFF150A21), width: 2),
                  ),
                ),
                Positioned(
                  left: 12,
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: const Color(0xFFA172F8),
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFF150A21), width: 2),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('+42', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
              Text('Attendees', style: TextStyle(color: Colors.white54, fontSize: 10)),
            ],
          )
        ],
      ),
    );
  }
}