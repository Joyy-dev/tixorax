import 'package:flutter/material.dart';
import 'package:tixora/screen/create_screen.dart';
import 'package:tixora/screen/discover_events_screen.dart';
import 'package:tixora/screen/profile_screen.dart';
import 'package:tixora/screen/ticket_screen.dart';

class EventBottomNavigation extends StatefulWidget {
  const EventBottomNavigation({super.key});

  @override
  State<EventBottomNavigation> createState() => _EventBottomNavigation();
}

class _EventBottomNavigation extends State<EventBottomNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    DiscoverEventsScreen(),
    TicketScreen(),
    CreateScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF160D26),
            border: Border(
              top: BorderSide(color: const Color.fromARGB(22, 255, 255, 255)),
            ),
          ),
          child: BottomNavigationBar( 
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor: const Color(0xFF4EE2D1),
            unselectedItemColor: Colors.white38,
            selectedLabelStyle: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
            elevation: 0,
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 6.0, top: 4.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: _selectedIndex == 0
                          ? const Color(0xFF261D42)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(Icons.explore, size: 24),
                  ),
                ),
                label: 'DISCOVER',
              ),
              const BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Icon(Icons.confirmation_num_outlined, size: 24),
                ),
                label: 'TICKETS',
              ),
              const BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Icon(Icons.add_circle_outline, size: 24),
                ),
                label: 'CREATE',
              ),
              const BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Icon(Icons.person_outline, size: 24),
                ),
                label: 'PROFILE',
              ),
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
    );
  }
}