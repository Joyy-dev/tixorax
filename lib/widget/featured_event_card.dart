import 'package:flutter/material.dart';
import 'package:tixora/screen/single_event_screen.dart';

class FeaturedEventCard extends StatelessWidget {
  const FeaturedEventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1436),
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage('assets/images/concert.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              const Color.fromARGB(148, 13, 6, 30),
              const Color(0xFF0D061E),
            ],
            stops: const [0.5, 0.8, 1.0],
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF84AD),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  'SELLING FAST',
                  style: TextStyle(
                    color: Color(0xFF640332),
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (_) => SingleEventScreen())
                    );
                  },
                  child: const Text(
                    'Electric Aurora 2024',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: const [
                    Icon(Icons.calendar_today, color: Colors.white70, size: 12),
                    SizedBox(width: 4),
                    Text(
                      'Aug 24 • 9:00 PM',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.location_on, color: Color(0xFF4EE2D1), size: 14),
                        SizedBox(width: 4),
                        Text(
                          'Neo Sphere, Berlin',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text(
                          'From',
                          style: TextStyle(color: Colors.white54, fontSize: 10),
                        ),
                        Text(
                          '\$89.00',
                          style: TextStyle(
                            color: Color(0xFF4EE2D1),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}