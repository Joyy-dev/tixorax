import 'package:flutter/material.dart';

class UpcomingListItem extends StatelessWidget {
  final String title;
  final String dateText;

  const UpcomingListItem(this.title, this.dateText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF160D26),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: AssetImage('assets/images/rave.png'),
                fit: BoxFit.cover,
              )
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 12, color: Color(0xFF4EE2D1)),
                    const SizedBox(width: 6),
                    Text(dateText, style: const TextStyle(color: Colors.white70, fontSize: 12)),
                  ],
                )
              ],
            )
          ),
          const Icon(Icons.chevron_right, color: Colors.white38)
        ],
      ),
    );
  }
}