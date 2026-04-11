import 'package:flutter/material.dart';
import 'package:tixora/widget/main_ticket_file.dart';
import 'package:tixora/widget/memory_card.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu, color: Colors.white54),
        title: const Center(
          child: Text('Pulse'),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
               radius: 16,
               backgroundColor: Color(0xFFFFCCAA),
               child: Icon(Icons.person, color: Colors.black54, size: 20),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Up Next',
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'LIVE IN 2H',
                    style: TextStyle(color: Color(0xFF4EE2D1), fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.5),
                  )
                ],
              ),
              const SizedBox(height: 24),
              MainTicketFile(),
              const SizedBox(height: 40),
              const Text(
                'Your Upcoming Pulse',
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildUpcomingListItem('Electric Dreams Festival', 'Nov 12 • 19:00 PM'),
              const SizedBox(height: 12),
              _buildUpcomingListItem('Synthesizer Symphony', 'Dec 05 • 20:30 PM'),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Past Memories',
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'VIEW ALL',
                    style: TextStyle(color: Color(0xFFAFA2FF), fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.5),
                  )
                ],
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: MemoryCard('Dark Matter Tour', 'AUG 2023')),
                  const SizedBox(width: 16),
                  Expanded(child: MemoryCard('Solstice Outdoor', 'JUL 2023')),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildUpcomingListItem(String title, String dateText) {
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