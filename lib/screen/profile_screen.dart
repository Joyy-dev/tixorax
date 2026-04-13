import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tixora/screen/authentication_screen.dart';
import 'package:tixora/services/auth.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _fullName = 'Loading...';
  String _email = 'Loading...';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        DocumentSnapshot doc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
        if (doc.exists && mounted) {
          setState(() {
            _fullName = doc.get('fullName') ?? 'Unknown User';
            _email = doc.get('email') ?? user.email ?? 'No email';
          });
        }
      } catch (e) {
        if (mounted) {
          setState(() {
            _fullName = 'Unknown User';
            _email = user.email ?? 'No email';
          });
        }
      }
    } else {
      if (mounted) {
        setState(() {
          _fullName = 'Guest';
          _email = 'Not signed in';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white54),
          onPressed: () {},
        ),
        title: const Center(
          child: Text('MY PROFILE'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white54),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              _buildProfileHeader(),
              const SizedBox(height: 32),
              _buildStatsRow(),
              const SizedBox(height: 40),
              _buildSectionHeader('Past Memories', 'VIEW ALL'),
              const SizedBox(height: 16),
              _buildMemoryCards(),
              const SizedBox(height: 40),
              _buildSectionHeader('Account Settings', null),
              const SizedBox(height: 16),
              _buildSettingsList(),
              const SizedBox(height: 32),
              _buildSignOutButton(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const RadialGradient(
                  colors: [
                    Color(0xFF9070E0),
                    Color(0xFF4EE2D1),
                    Colors.transparent,
                  ],
                  stops: [0.5, 0.8, 1.0],
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF4EE2D1).withOpacity(0.3),
                    spreadRadius: 4,
                    blurRadius: 15,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: const CircleAvatar(
                  radius: 56,
                  backgroundColor: Color(0xFF1E1436),
                  backgroundImage: AssetImage('assets/images/concert.jpg'), // Placeholder
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF4EE2D1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'FOUNDER',
                style: TextStyle(
                  color: Color(0xFF0D061E),
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          _fullName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          _email,
          style: const TextStyle(
            color: Colors.white54,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildStatsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildStatBox('42', 'EVENTS', const Color(0xFF4EE2D1)),
        _buildStatBox('128', 'TICKETS', const Color(0xFFAFA2FF)),
        _buildStatBox('2.4k', 'FOLLOWING', const Color(0xFFFF8FA3)),
      ],
    );
  }

  Widget _buildStatBox(String value, String label, Color valueColor) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1436),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                color: valueColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white54,
                fontSize: 10,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, String? actionText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (actionText != null)
          Text(
            actionText,
            style: const TextStyle(
              color: Color(0xFF4EE2D1),
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
      ],
    );
  }

  Widget _buildMemoryCards() {
    return SizedBox(
      height: 180,
      child: ListView(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        children: [
          _buildMemoryCard(
            'Electric Jungle NYC',
            'October 14, 2023',
            '2023 REWIND',
            const Color(0xFFFF8FA3),
          ),
          const SizedBox(width: 16),
          _buildMemoryCard(
            'Solar Pulse 2022',
            'August 02, 2022',
            'VIP ACCESS',
            const Color(0xFFFF8FA3),
          ),
        ],
      ),
    );
  }

  Widget _buildMemoryCard(String title, String date, String tag, Color tagColor) {
    return Container(
      width: 240,
      decoration: BoxDecoration(
        color: const Color(0xFF1E1436),
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: AssetImage('assets/images/concert.jpg'), // Using available asset
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black54,
            BlendMode.darken,
          ),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              const Color(0xFF1E1436).withOpacity(0.8),
              const Color(0xFF1E1436),
            ],
            stops: const [0.3, 0.7, 1.0],
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: tagColor.withOpacity(0.9),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                tag,
                style: const TextStyle(
                  color: Color(0xFF0D061E),
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              date,
              style: const TextStyle(
                color: Colors.white54,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsList() {
    return Column(
      children: [
        _buildSettingsTile(Icons.person, 'Personal Information'),
        _buildSettingsTile(Icons.confirmation_num_outlined, 'My Tickets', badge: '3 NEW'),
        _buildSettingsTile(Icons.payment, 'Payment Methods'),
        _buildSettingsTile(Icons.notifications_none, 'Notification Settings'),
        _buildSettingsTile(Icons.lock_outline, 'Privacy & Security'),
        _buildSettingsTile(Icons.help_outline, 'Help & Support'),
      ],
    );
  }

  Widget _buildSettingsTile(IconData icon, String title, {String? badge}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF160D26),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFAFA2FF), size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (badge != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFAFA2FF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                badge,
                style: const TextStyle(
                  color: Color(0xFF0D061E),
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          const Icon(Icons.chevron_right, color: Colors.white38, size: 24),
        ],
      ),
    );
  }

  Widget _buildSignOutButton() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFFF8FA3).withOpacity(0.5),
          width: 1.5,
        ),
      ),
      child: TextButton(
        onPressed: () async {
          await AuthService().signOut();
          if (!context.mounted) return;
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const AuthenticationScreen()),
            (route) => false,
          );
        },
        child: const Text(
          'SIGN OUT',
          style: TextStyle(
            color: Color(0xFFFF8FA3),
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ),
      ),
    );
  }
}
