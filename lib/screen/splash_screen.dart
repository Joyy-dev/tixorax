import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF6A567F),
                      blurRadius: 30,
                      spreadRadius: 2,
                    )
                  ],
                  borderRadius: BorderRadius.circular(100)
                ),
                child: Icon(
                  Icons.wifi,
                  color: Theme.of(context).splashColor,
                  size: 100,
                ),
              ),
              SizedBox(height: 30,),
              ShaderMask(
                blendMode: BlendMode.srcIn,                
                shaderCallback: (bounds) => LinearGradient(
                  colors: [
                    Theme.of(context).splashColor,
                    Color(0xFF3A284E),
                    Color(0xFFB39CFF),
                    Color(0xFF00C0AE)
                  ]
                ).createShader(Rect.fromCenter(center: Offset(90, 90), width: bounds.width, height: bounds.height)),
                child: Text(
                  'TixoraX',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 60
                  ),
                ),
              ),
              ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (bounds) => LinearGradient(
                  colors: [
                    Theme.of(context).splashColor,
                    Color(0xFFB39CFF)
                  ]
                ).createShader(Rect.fromCenter(center: Offset(90, 90), width: bounds.width, height: bounds.height)),
                child: Text(
                  'LIVE MUSIC 🎶 CURATED BEATS 🪘 URBAN RYTHM 💕',
                  style: TextStyle(
                    fontSize: 15,
                    letterSpacing: 5
                  ),textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 40,),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xFF8155FF),
                      Color(0xFFCDBDFF)
                    ]
                  ),
                  borderRadius: BorderRadius.circular(40)
                ),
                child: ElevatedButton(
                  onPressed: () {}, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    foregroundColor: Theme.of(context).primaryColor,
                    minimumSize: Size(double.infinity, 60),
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  child: Text(
                    'Experience the Vibe'
                  )
                ),
              ),
              SizedBox(height: 15,),
              Text(
                '@2026 TixoraX Group. Designed For Efficient Event Booking',
                style: TextStyle(
                  color: Theme.of(context).splashColor,
                  fontSize: 13
                ),textAlign: TextAlign.center,
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0xFF9E88B4),
                        child: Icon(Icons.location_pin, color: Theme.of(context).primaryColor,),
                      ),
                      Text(
                        'DISCOVER',
                        style: TextStyle(
                          color: Theme.of(context).splashColor,
                          fontSize: 13,
                          letterSpacing: 1
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0xFF9E88B4),
                        child: Icon(Icons.event_note, color: Theme.of(context).primaryColor,),
                      ),
                      Text(
                        'TICKETS',
                        style: TextStyle(
                          color: Theme.of(context).splashColor,
                          fontSize: 13,
                          letterSpacing: 1
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0xFF9E88B4),
                        child: Icon(Icons.person, color: Color(0xFF3A284E),),
                      ),
                      Text(
                        'ACCOUNT',
                        style: TextStyle(
                          color: Theme.of(context).splashColor,
                          fontSize: 13,
                          letterSpacing: 1
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}