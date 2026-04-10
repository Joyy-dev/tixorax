import 'package:flutter/material.dart';

class DiscoverEventsScreen extends StatefulWidget {
  const DiscoverEventsScreen({super.key});

  @override
  State<DiscoverEventsScreen> createState() => _DiscoverEventsScreenState();
}

class _DiscoverEventsScreenState extends State<DiscoverEventsScreen> {
  int _selectedIndex = 0;
  int _selectedCategoryIndex = 0;
  
  final List<String> categories = ['All', 'Music', 'Sports', 'Arts'];

  final List<Map<String, dynamic>> upcomingEvents = [
    {
      'title': 'Secret Garden Jazz',
      'date': 'Friday • 19:30',
      'distance': '2.4 miles away',
      'price': '\$25.00',
      'image': 'assets/images/concert.jpg',
    },
    {
      'title': 'Comedy Under the Stars',
      'date': 'Saturday • 20:00',
      'distance': '0.8 miles away',
      'price': '\$15.00',
      'image': 'assets/images/concert.jpg',
    },
    {
      'title': 'Neo-Pop Collective',
      'date': 'Sunday • 18:00',
      'distance': '1.2 miles away',
      'price': '\$42.00',
      'image': 'assets/images/concert.jpg',
    },
    {
      'title': 'Midnight Rave',
      'date': 'Saturday • 23:30',
      'distance': '3.5 miles away',
      'price': '\$30.00',
      'image': 'assets/images/concert.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D061E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.white54),
        title: const Center(
          child: Text(
            'Pulse',
            style: TextStyle(
              color: Color(0xFF9070E0),
              fontSize: 22,
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
              letterSpacing: -0.5,
            ),
          ),
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
              // Search Bar
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1436),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const TextField(
                  style: TextStyle(color: Colors.white, fontSize: 14),
                  decoration: InputDecoration(
                    hintText: 'Search for events, artists, or venues',
                    hintStyle: TextStyle(color: Colors.white38, fontSize: 14),
                    prefixIcon: Icon(Icons.search, color: Colors.white38, size: 20),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Categories
              SizedBox(
                height: 36,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final isSelected = index == _selectedCategoryIndex;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedCategoryIndex = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 12),
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xFF9B7EED) : const Color(0xFF1E1436),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          categories[index],
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.white60,
                            fontSize: 13,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 32),
              // Featured Events Header
              const Text(
                'RECOMMENDED',
                style: TextStyle(
                  color: Color(0xFF4EE2D1),
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Featured Events',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'View all',
                    style: TextStyle(
                      color: Color(0xFFAFA2FF),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Featured Events Carousel
              SizedBox(
                height: 280,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return _buildFeaturedEventCard();
                  },
                ),
              ),
              const SizedBox(height: 32),
              // Upcoming Near You
              const Text(
                'Upcoming Near You',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ...upcomingEvents.map((event) => _buildUpcomingCard(event)).toList(),
              const SizedBox(height: 80), // Padding for bottom nav overlap
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF9070E0),
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: const Icon(Icons.map, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF160D26),
            border: Border(top: BorderSide(color: Colors.white.withOpacity(0.05))),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor: const Color(0xFF4EE2D1),
            unselectedItemColor: Colors.white38,
            selectedLabelStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 0.5),
            unselectedLabelStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 0.5),
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
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: _selectedIndex == 0 ? const Color(0xFF261D42) : Colors.transparent,
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
    );
  }

  Widget _buildFeaturedEventCard() {
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
              const Color(0xFF0D061E).withOpacity(0.8),
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
                const Text(
                  'Electric Aurora 2024',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
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

  Widget _buildUpcomingCard(Map<String, dynamic> event) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF160D26),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(event['image']),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event['title'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  event['date'],
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      event['distance'],
                      style: const TextStyle(
                        color: Color(0xFF4EE2D1),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      event['price'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
