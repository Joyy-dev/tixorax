import 'package:flutter/material.dart';
import 'package:tixora/widget/header_image.dart';

class SingleEventScreen extends StatelessWidget {
  const SingleEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderImage(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Text(
                        'NEON PULSE:\nMIDNIGHT ECHOES',
                          style: TextStyle(
                          color: Color(0xFF90E0EF),
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                          height: 1.1,
                          letterSpacing: -0.5,
                        ),
                      ),
                      const SizedBox(height: 24),
                      _buildInfoCards(),
                      const SizedBox(height: 32),
                      _buildSectionTitle('About this Event'),
                      const SizedBox(height: 16),
                      _buildAboutSection(),
                      const SizedBox(height: 32),
                      _buildSectionTitle('Location'),
                      const SizedBox(height: 16),
                      _buildLocationSection(),
                      const SizedBox(height: 32),
                      _buildSectionTitle('Organizer'),
                      const SizedBox(height: 16),
                      _buildOrganizerSection(),
                      const SizedBox(height: 120), // Bottom padding for fixed bar
                    ],
                  ),
                ),
              ],
            ),
          ),
          _buildBottomBar(),
        ],
      ),
    );
  }



  Widget _buildInfoCards() {
    return Column(
      children: [
        _buildInfoCard(Icons.calendar_today, 'DATE', 'Oct 24, 2024'),
        const SizedBox(height: 12),
        _buildInfoCard(Icons.access_time, 'TIME', '21:00 - 04:00', iconColor: const Color(0xFF4EE2D1)),
        const SizedBox(height: 12),
        _buildInfoCard(Icons.confirmation_num_outlined, 'AVAILABILITY', 'Limited Tickets', iconColor: const Color(0xFFFFAFA2)),
      ],
    );
  }

  Widget _buildInfoCard(IconData icon, String title, String subtitle, {Color iconColor = const Color(0xFFAFA2FF)}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1436),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF33255B),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white54,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
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
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildAboutSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF160D26),
        borderRadius: BorderRadius.circular(16),
        border: const Border(
          left: BorderSide(
            color: Color(0xFF9070E0),
            width: 4,
          ),
        ),
      ),
      child: const Text(
        'Step into a world where light and sound collide. Neon Pulse: Midnight Echoes is more than just a concert—it\'s an immersive audiovisual journey designed to transport you to the futuristic landscape of synthwave and deep house.\n\nFeaturing world-class production, 3D laser mapping, and a curated lineup of underground legends, this night promises to be the peak of the season. Dress in your best cyberpunk attire and prepare for a pulse-pounding experience.',
        style: TextStyle(
          color: Colors.white70,
          fontSize: 14,
          height: 1.6,
        ),
      ),
    );
  }

  Widget _buildLocationSection() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF1E1436),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.location_on, color: Color(0xFF4EE2D1), size: 20),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'The Warehouse District',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '404 Electric Ave, Night City, NC 90210',
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                margin: const EdgeInsets.only(left: 32),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFF33255B),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  'GET DIRECTIONS',
                  style: TextStyle(
                    color: Color(0xFF4EE2D1),
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _buildMapPlaceholder(),
      ],
    );
  }

  Widget _buildMapPlaceholder() {
    return Container(
      height: 160,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF261D42),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Opacity(
              opacity: 0.3,
              child: GridPaper(
                color: Colors.white12,
                divisions: 1,
                interval: 20,
                subdivisions: 1,
                child: Container(width: double.infinity, height: double.infinity),
              ),
            ),
            // Map pin icon style
            Image.network('https://img.icons8.com/color/48/marker.png'),
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFF9070E0).withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: const BoxDecoration(
                    color: Color(0xFF9070E0),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.near_me, color: Colors.white, size: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrganizerSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF160D26),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundColor: Color(0xFFFFCCAA),
            child: Icon(Icons.person, color: Colors.black54),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Pulse Collective',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '42.5k Followers • 120 Events',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF33255B),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              'FOLLOW',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        decoration: BoxDecoration(
          color: const Color(0xFF160D26),
          border: Border(
            top: BorderSide(
              color: Colors.white.withOpacity(0.05),
              width: 1,
            ),
          ),
        ),
        child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'PRICE STARTS AT',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '\$89.00',
                    style: TextStyle(
                      color: Color(0xFF4EE2D1),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF9B7EED),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Row(
                  children: const [
                    Text(
                      'Buy Tickets',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward, size: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
