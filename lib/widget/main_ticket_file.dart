import 'package:flutter/material.dart';
import 'package:tixora/widget/dash_line_painter.dart';

class MainTicketFile extends StatelessWidget {
  const MainTicketFile({super.key});

  @override
  Widget build(BuildContext context) {
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
                    Colors.black12,
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
                child: SizedBox(
                  height: 1,
                  child: DashLinePainter(), // ✅ clean & reusable
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

          Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 16.0, bottom: 24.0),
            child: Column(
              children: [
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
}