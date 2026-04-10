import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1E1436), 
              padding: const EdgeInsets.symmetric(vertical: 16,),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
               elevation: 0,
            ),
            onPressed: () {}, 
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.g_mobiledata, size: 30,),
                Text(
                  'Google',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),
                ),
              ],
            )
          ),
        ),
        const SizedBox(width: 16,),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1E1436), 
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16,),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
               elevation: 0,
            ),
            onPressed: () {}, 
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.apple, size: 20,),
                Text(
                  'Apple',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            )
          ),
        ),
      ],
    );
  }
}