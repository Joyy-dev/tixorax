import 'package:flutter/material.dart';
import 'package:tixora/screen/auth_screen.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF241338),
        elevation: 10,
        title: ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) => LinearGradient(
            colors: [
              Color(0xFF370096),
              Color(0xFF9A7BFF),
              Color(0xFFB39CFF)
            ]
          ).createShader(Rect.fromCenter(center: Offset(19, 1), width: bounds.width, height: bounds.height)),
          child: Text(
            'TimoraX',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context, 
                MaterialPageRoute(builder: (context) => AuthScreen())
              );
            }, 
            child: Text(
              'SKIP',
              style: TextStyle(
                color: Color(0xFFB39CFF),
                fontSize: 18
              ),
            )
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFF070417),
          image: DecorationImage(
            image: AssetImage('assets/images/concert.jpg'),
            fit: BoxFit.cover,
            opacity: 0.6
          ),
        ),
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15, bottom: 60),
          color: Color.fromARGB(204, 36, 19, 56),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                
                decoration: BoxDecoration(
                  color: Color(0xFFFF84AD),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Text(
                  'LIVE NOW',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    color: Color(0xFF640332)
                  ),
                ),
              ),
              SizedBox(height: 15,),
              RichText(
                text: TextSpan(
                  text: 'Discover the',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                  children: [
                    TextSpan(
                      text: '\nElectric.',
                      style: TextStyle(
                        fontSize: 40,
                        color: Color(0xFF9A7BFF),
                        fontWeight: FontWeight.bold
                      )
                    )
                  ]
                )
              ),
              SizedBox(height: 10,),
              Text(
                'Unlock exclusive access to the city\'s most underground sounds and world-class performance. Your next core memory starts here.',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFFE8DEFF)
                ),
              ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF8155FF),
                      Color(0xFFCDBDFF)
                    ]
                  )
                ),
                child: TextButton(
                  onPressed: () {}, 
                  child: Text(
                    'Find My Pulse',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                      fontSize: 15
                    ),
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}