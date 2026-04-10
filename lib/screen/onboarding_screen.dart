import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tixora/screen/authentication_screen.dart';
import 'package:tixora/screen/discover_screen.dart';
import 'package:tixora/widget/attendees_card.dart';
import 'package:tixora/widget/booking_alert_card.dart';
import 'package:tixora/widget/dashboard_card.dart';
import 'package:tixora/widget/plus_card.dart';
import 'package:tixora/widget/sales_card.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoPlay();
  }

  void _startAutoPlay() {
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_pageController.hasClients) {
        int nextPage = _pageController.page!.round() + 1;
        if (nextPage > 1) {
          nextPage = 0; 
        }
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          const DiscoverScreen(),
          _buildOnboardingContent(context),   
        ],
      ),
    );
  }

  Widget _buildOnboardingContent(BuildContext context) {
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Tixora X',
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
                          MaterialPageRoute(builder: (_) => const AuthenticationScreen())
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
                
                Expanded(
                  child: Center(
                    child: SizedBox(
                      height: 400,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            width: 200,
                            height: 260,
                            child: DashboardCard(),
                          ),
                          
                          Positioned(
                            right: 0,
                            top: 0,
                            width: 120,
                            height: 160,
                            child: SalesCard(),
                          ),
                          
                          Positioned(
                            right: 0,
                            top: 175,
                            width: 120,
                            height: 85,
                            child: PlusCard(),
                          ),
                          
                          Positioned(
                            left: 0,
                            bottom: 45,
                            width: 130,
                            height: 80,
                            child: AttendeesCard(),
                          ),
                          
                          Positioned(
                            right: 0,
                            bottom: 45,
                            width: 190,
                            height: 80,
                            child: BookingAlertCard(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                
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
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      )
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      _pageController.animateToPage(
                        1, 
                        duration: const Duration(milliseconds: 300), 
                        curve: Curves.easeInOut,
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
}
