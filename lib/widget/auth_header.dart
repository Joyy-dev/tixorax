import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  final bool isLogin;

  const AuthHeader({super.key, required this.isLogin});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          isLogin ? 'Welcome back' : 'Experience the best',
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        Text(
          isLogin
              ? 'The energy is waiting. Log in to your Tixora account'
              : 'Create an account to unlock exclusive access.',
          style: const TextStyle(color: Colors.white60),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}