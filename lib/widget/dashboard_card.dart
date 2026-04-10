import 'package:flutter/material.dart';
import 'package:tixora/widget/fake_row.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF130E22),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color.fromARGB(10, 255, 255, 255)),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(52, 140, 100, 240),
            blurRadius: 30,
            spreadRadius: 5,
          )
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('9:41 AM', style: TextStyle(color: Colors.white38, fontSize: 8)),
              Row(
                children: const [
                  Icon(Icons.wifi, color: Colors.white38, size: 10),
                  SizedBox(width: 2),
                  Icon(Icons.battery_full, color: Colors.white38, size: 10),
                ],
              )
            ],
          ),
          const SizedBox(height: 16),
          Container(
            height: 24,
            decoration: BoxDecoration(
              color: const Color.fromARGB(26, 255, 255, 255),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: const [
                Icon(Icons.search, color: Colors.white38, size: 12),
                SizedBox(width: 4),
                Text('Search attendees...', style: TextStyle(color: Colors.white38, fontSize: 8)),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: const [
              Text('Ticket Sales', style: TextStyle(color: Colors.white54, fontSize: 8)),
            ],
          ),
          const SizedBox(height: 6),
          Container(height: 2, color: const Color.fromARGB(183, 78, 226, 209)),
          const SizedBox(height: 16),
          FakeRow(),
          const SizedBox(height: 8),
          FakeRow(),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
            decoration: BoxDecoration(
              color: const Color.fromARGB(40, 78, 226, 209),
              borderRadius: BorderRadius.circular(4)
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(width: 6, height: 6, decoration: const BoxDecoration(color: Color(0xFF4EE2D1), shape: BoxShape.circle)),
                const SizedBox(width: 6),
                const Text('LIVE SETUP', style: TextStyle(color: Color(0xFF4EE2D1), fontSize: 9, fontWeight: FontWeight.bold, letterSpacing: 1)),
              ],
            ),
          ),
          const SizedBox(height: 8),
          const Text('Summer Solstice Rave', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          const Text('2.4k Tickets Available', style: TextStyle(color: Colors.white54, fontSize: 10)),
        ],
      ),
    );
}}