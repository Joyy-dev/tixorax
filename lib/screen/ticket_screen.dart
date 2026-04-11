import 'package:flutter/material.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  int _selectedIndex = 1;

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
              _buildMainTicketCard(),
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
                  Expanded(child: _buildPastMemoryCard('Dark Matter Tour', 'AUG 2023')),
                  const SizedBox(width: 16),
                  Expanded(child: _buildPastMemoryCard('Solstice Outdoor', 'JUL 2023')),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
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
              const BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Icon(Icons.explore_outlined, size: 24),
                ),
                label: 'DISCOVER',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 6.0, top: 4.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: _selectedIndex == 1 ? const Color(0xFF261D42) : Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(Icons.confirmation_num, size: 24),
                  ),
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

  Widget _buildMainTicketCard() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF160D26),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          // Top Event Cover Art
          Container(
            height: 160,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              image: DecorationImage(
                image: AssetImage('assets/images/concert.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.1),
                     const Color(0xFF160D26),
                  ],
                  stops: const [0.5, 1.0],
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF84AD),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text('MAIN STAGE', style: TextStyle(color: Color(0xFF640332), fontSize: 9, fontWeight: FontWeight.bold)),
                  ),
                  const Text('Neon Cathedral: Midnight Set', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w800, height: 1.2)),
                ],
              ),
            ),
          ),
          
          // Ticket Information
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('DATE', style: TextStyle(color: Colors.white54, fontSize: 10, letterSpacing: 1.2)),
                    SizedBox(height: 4),
                    Text('Fri, Oct 24', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                    SizedBox(height: 16),
                    Text('SECTION', style: TextStyle(color: Colors.white54, fontSize: 10, letterSpacing: 1.2)),
                    SizedBox(height: 4),
                    Text('Floor G2', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text('DOORS', style: TextStyle(color: Colors.white54, fontSize: 10, letterSpacing: 1.2)),
                    SizedBox(height: 4),
                    Text('22:00 PM', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                    SizedBox(height: 16),
                    Text('ENTRY', style: TextStyle(color: Colors.white54, fontSize: 10, letterSpacing: 1.2)),
                    SizedBox(height: 4),
                    Text('Gate 4B', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                  ],
                )
              ],
            ),
          ),

          // Divider Line with Edge Notches
          Row(
            children: [
              Container(
                height: 24,
                width: 12,
                decoration: const BoxDecoration(
                  color: Color(0xFF0D061E),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12)
                  ),
                ),
              ),
              Expanded(
                child: CustomPaint(
                  painter: _DashedLinePainter(),
                ),
              ),
              Container(
                height: 24,
                width: 12,
                decoration: const BoxDecoration(
                  color: Color(0xFF0D061E),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12)
                  ),
                ),
              ),
            ],
          ),

          // Bottom QR and Actions
          Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 16.0, bottom: 24.0),
            child: Column(
              children: [
                // QR Code Display
                Container(
                  width: 220,
                  height: 220,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Center(
                     child: Container(
                       width: 200,
                       height: 200,
                       color: const Color(0xFF5ABEA8),
                       child: Center(
                         child: Container(
                           width: 90,
                           height: 150,
                           decoration: BoxDecoration(
                             color: Colors.white,
                             boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(2, 4))]
                           ),
                           alignment: Alignment.center,
                           child: const Icon(Icons.qr_code_2, size: 70, color: Colors.black87)
                         )
                       )
                     )
                  )
                ),
                const SizedBox(height: 20),
                const Text('#PULSE-XJ92-9901', style: TextStyle(color: Colors.white38, fontSize: 10, letterSpacing: 2, fontWeight: FontWeight.bold)),
                const SizedBox(height: 24),
                // Action Buttons
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.share, size: 16),
                        label: const Text('SHARE', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2E1C4B),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                          elevation: 0,
                        ),
                        onPressed: (){},
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 5,
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.account_balance_wallet, size: 16, color: Color(0xFF1B0F3A)),
                        label: const Text('APPLE WALLET', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF1B0F3A))),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFAFA2FF),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                          elevation: 0,
                        ),
                        onPressed: (){},
                      )
                    )
                  ],
                )
              ]
            )
          )
        ],
      )
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
                image: AssetImage('assets/images/concert.jpg'),
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

  Widget _buildPastMemoryCard(String title, String dateTag) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: const DecorationImage(
              image: AssetImage('assets/images/concert.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                stops: const [0.5, 1.0]
              )
            ),
            padding: const EdgeInsets.all(12),
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(4)
              ),
              child: Text(dateTag, style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold)),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(title, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600)),
      ],
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 6, dashSpace = 6, startX = 0;
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.1)
      ..strokeWidth = 1.5;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
