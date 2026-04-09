import 'package:flutter/material.dart';
import 'package:tixora/screen/discover_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF070417),
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(-0.5, -0.3),
            radius: 1.2,
            colors: [Color(0xFF1A1133), Color(0xFF070417)],
            stops: [0.0, 1.0],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Pulse',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: Color(0xFF8B64F0),
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic,
                        letterSpacing: -0.5,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                         Navigator.pushReplacement(
                           context, 
                           MaterialPageRoute(builder: (_) => const DiscoverScreen())
                         );
                      },
                      child: const Text(
                        'SKIP',
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                
                // Illustration Cluster
                Expanded(
                  child: Center(
                    child: SizedBox(
                      height: 400,
                      child: Stack(
                        children: [
                          // Dashboard Card (Left)
                          Positioned(
                            left: 0,
                            top: 0,
                            width: 200,
                            height: 260,
                            child: _buildDashboardCard(),
                          ),
                          
                          // Total Sales (Top Right)
                          Positioned(
                            right: 0,
                            top: 0,
                            width: 120,
                            height: 160,
                            child: _buildSalesCard(),
                          ),
                          
                          // Plus Button (Mid Right)
                          Positioned(
                            right: 0,
                            top: 175,
                            width: 120,
                            height: 85,
                            child: _buildPlusCard(),
                          ),
                          
                          // Attendees (Bottom Left)
                          Positioned(
                            left: 0,
                            bottom: 45,
                            width: 130,
                            height: 80,
                            child: _buildAttendeesCard(),
                          ),
                          
                          // New Booking (Bottom Right)
                          Positioned(
                            right: 0,
                            bottom: 45,
                            width: 190,
                            height: 80,
                            child: _buildBookingAlertCard(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                
                // Texts
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                    ),
                    children: [
                      const TextSpan(text: 'Host with ', style: TextStyle(color: Colors.white)),
                      WidgetSpan(
                        child: ShaderMask(
                          blendMode: BlendMode.srcIn,
                          shaderCallback: (bounds) => const LinearGradient(
                            colors: [Color(0xFFA172F8), Color(0xFF6BADD8)],
                          ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                          child: const Text('Ease.', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                
                const Text(
                  'From underground warehouse parties to stadium\ntours. Manage tickets, tracking, and hype in one\nelectric dashboard.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 32),
                
                // Get Started Button
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF261845), Color(0xFF110822)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      )
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context, 
                        MaterialPageRoute(builder: (_) => const DiscoverScreen())
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Get Started',
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_forward, color: Colors.white, size: 20),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                
                // View Hosting Guide
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'View Hosting Guide',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: Color(0xFFB197F4),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDashboardCard() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF130E22),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.04)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF8B64F0).withOpacity(0.12),
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
              color: Colors.white.withOpacity(0.04),
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
          Container(height: 2, color: const Color(0xFF4EE2D1).withOpacity(0.6)),
          const SizedBox(height: 16),
          _buildFakeRow(),
          const SizedBox(height: 8),
          _buildFakeRow(),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
            decoration: BoxDecoration(
              color: const Color(0xFF4EE2D1).withOpacity(0.1),
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
  }

  Widget _buildFakeRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(width: 40, height: 3, color: Colors.white12),
        Container(width: 30, height: 3, color: Colors.white12),
        Container(width: 20, height: 3, color: Colors.white12),
      ],
    );
  }

  Widget _buildSalesCard() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E1332),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.04)),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
             padding: const EdgeInsets.all(8),
             decoration: BoxDecoration(
               color: const Color(0xFF3B2561),
               borderRadius: BorderRadius.circular(10),
             ),
             child: const Icon(Icons.bar_chart, color: Color(0xFF4EE2D1), size: 16),
          ),
          const Spacer(),
          const Text('TOTAL SALES', style: TextStyle(color: Colors.white54, fontSize: 8, fontWeight: FontWeight.bold, letterSpacing: 1)),
          const SizedBox(height: 4),
          const Text('\$12.8k', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildPlusCard() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1A112C),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.04)),
      ),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
               BoxShadow(
                 color: Colors.white.withOpacity(0.2),
                 blurRadius: 10,
                 spreadRadius: 2,
               )
            ]
          ),
          child: const Icon(Icons.add, color: Color(0xFF1A112C), size: 24)
        ),
      ),
    );
  }

  Widget _buildAttendeesCard() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF150A21),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.04)),
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

  Widget _buildBookingAlertCard() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E1332),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.04)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Container(
             padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
             decoration: BoxDecoration(
               color: const Color(0xFFF07B96).withOpacity(0.2),
               borderRadius: BorderRadius.circular(6),
             ),
             child: const Icon(Icons.local_activity, color: Color(0xFFF07B96), size: 14),
          ),
          const SizedBox(width: 12),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('New booking alert', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
              SizedBox(height: 2),
              Text('Just now', style: TextStyle(color: Colors.white54, fontSize: 10)),
            ],
          )
        ],
      ),
    );
  }
}
