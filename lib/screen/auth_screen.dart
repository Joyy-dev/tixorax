import 'package:flutter/material.dart';
import 'package:tixora/screen/discover_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isLogin = true;
  bool _obscurePassword = true;

  void _toggleAuthMode() {
    setState(() {
      _isLogin = !_isLogin;
      _obscurePassword = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D061E), 
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (!_isLogin) {
                            _toggleAuthMode();
                          } else {
                            Navigator.pop(context);
                          }
                        },
                        child: Icon(
                          _isLogin ? Icons.menu : Icons.close, 
                          color: Colors.white54, 
                          size: 24
                        ),
                      ),
                      
                      if (_isLogin)
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color.fromARGB(31, 78, 226, 209),
                            border: Border.all(color: const Color(0xFF4EE2D1), width: 1.5),
                          ),
                          child: const Icon(Icons.person, color: Color(0xFF4EE2D1), size: 20),
                        )
                      else
                        const SizedBox(width: 32),
                    ],
                  ),
                  
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (!_isLogin) ...[
                        const Icon(Icons.flash_on, color: Color(0xFFAFA2FF), size: 24),
                        const SizedBox(width: 4),
                      ],
                      Text(
                        _isLogin ? 'Pulse' : 'Electric Pulse',
                        style: TextStyle(
                          color: _isLogin ? const Color(0xFF9070E0) : Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.italic,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 40),
                    
                    Text(
                      _isLogin ? 'Welcome back' : 'Experience the Beat',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      _isLogin 
                        ? 'The energy is waiting. Log in to your pulse.'
                        : 'Create an account to unlock exclusive\naccess to the world\'s most vibrant events.',
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 14,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),
                    
                    if (!_isLogin) ...[
                      _buildTextField(
                        label: 'FULL NAME',
                        hint: 'John Doe',
                        prefixIcon: Icons.person_outline,
                      ),
                      const SizedBox(height: 20),
                    ],
                    
                    _buildTextField(
                      label: 'EMAIL ADDRESS',
                      hint: _isLogin ? 'name@example.com' : 'hello@pulse.com',
                      prefixIcon: Icons.mail_outline,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20),
                    
                    _buildTextField(
                      label: 'PASSWORD',
                      hint: '••••••••',
                      prefixIcon: Icons.lock_outline,
                      isPassword: true,
                      labelRightHelper: _isLogin 
                        ? GestureDetector(
                            onTap: () {},
                            child: const Text(
                              'Forgot?',
                              style: TextStyle(
                                color: Color(0xFF4EE2D1),
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : null,
                      suffixIcon: !_isLogin 
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                            child: Icon(
                              _obscurePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                              color: Colors.white38,
                              size: 18,
                            ),
                          )
                        : null,
                    ),
                    const SizedBox(height: 32),
                    
                    // Main Action Button
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(41, 153, 113, 245),
                            blurRadius: 20,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                           Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => const DiscoverScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF9B7EED),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          _isLogin ? 'Sign In' : 'Join the Pulse',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1B0F3A),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    
                    // Divider
                    Row(
                      children: [
                        Expanded(child: Container(height: 1, color: const Color.fromARGB(29, 255, 255, 255))),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            _isLogin ? 'OR CONNECT WITH' : 'OR CONTINUE WITH',
                            style: const TextStyle(
                              color: Colors.white38,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                        Expanded(child: Container(height: 1, color: const Color.fromARGB(34, 255, 255, 255))),
                      ],
                    ),
                    const SizedBox(height: 30),
                    
                    // Social Buttons
                    Row(
                      children: [
                        Expanded(
                          child: _buildSocialBtn('Google', Icons.g_mobiledata),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildSocialBtn('Apple', Icons.apple),
                        ),
                      ],
                    ),
                    const SizedBox(height: 48),
                    
                    // Toggle Mode Link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _isLogin ? 'Don\'t have an account? ' : 'Already have an account? ',
                          style: const TextStyle(
                            color: Colors.white60,
                            fontSize: 13,
                          ),
                        ),
                        GestureDetector(
                          onTap: _toggleAuthMode,
                          child: Text(
                            _isLogin ? 'Join the Pulse' : 'Sign In',
                            style: const TextStyle(
                              color: Color(0xFF4EE2D1),
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    
                    if (_isLogin) ...[
                      const SizedBox(height: 60),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('PRIVACY', style: TextStyle(color: Colors.white38, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1)),
                          SizedBox(width: 24),
                          Text('TERMS', style: TextStyle(color: Colors.white38, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1)),
                          SizedBox(width: 24),
                          Text('HELP', style: TextStyle(color: Colors.white38, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1)),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ] else ...[
                      const SizedBox(height: 40),
                    ]
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required IconData prefixIcon,
    bool isPassword = false,
    TextInputType keyboardType = TextInputType.text,
    Widget? labelRightHelper,
    Widget? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Colors.white60,
                fontSize: 10,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            if (labelRightHelper != null) labelRightHelper,
          ],
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF22153B),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color.fromARGB(41, 255, 255, 255)),
          ),
          child: TextField(
            obscureText: isPassword && _obscurePassword,
            keyboardType: keyboardType,
            style: const TextStyle(color: Colors.white, fontSize: 14),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.white38, fontSize: 14),
              prefixIcon: Icon(prefixIcon, color: Colors.white38, size: 18),
              suffixIcon: suffixIcon,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialBtn(String text, IconData icon) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF1E1436), // slightly lighter than background
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (text == 'Google')
            const Text('G', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16))
          else
            Icon(icon, color: Colors.white, size: 20),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}