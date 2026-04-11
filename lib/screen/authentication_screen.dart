import 'package:flutter/material.dart';
//import 'package:tixora/screen/discover_events_screen.dart';
import 'package:tixora/services/auth.dart';
import 'package:tixora/widget/auth_app_bar.dart';
import 'package:tixora/widget/auth_header.dart';
import 'package:tixora/widget/event_bottom_navigation.dart';
import 'package:tixora/widget/social_button.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final _formKey = GlobalKey<FormState>();
  final  _nameController = TextEditingController();
  final  _emailController = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _authService = AuthService();
  bool _isLogin = true;
  bool _isLoading = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  Future<void> _submitAuthForm() async {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text.trim();
      final email = _emailController.text.trim();
      final password = _passwordcontroller.text.trim();

      if (email.isEmpty || password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please fill in all fields')));
        return;
      }
      if (!_isLogin && name.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please enter your name')));
        return;
      }
      setState(() {
        _isLoading = true;
      });

      try {
        if (_isLogin) {
          await _authService.signIn(
            email: email, 
            password: password
          );
        } else {
          await _authService.signUp(
            email: email, 
            password: password, 
            fullName: name
          );
        }
        if (mounted) {
          Navigator.pushReplacement(
            context, 
            MaterialPageRoute(builder: (_) => EventBottomNavigation())
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString().replaceAll('Exception: ', ''))));
        }
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    }
  }

  void _toggleAuthMode() {
    setState(() {
      _isLogin = !_isLogin;
      _obscurePassword = true;
    });
  }
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AuthAppBar(
        isLogin: _isLogin, 
        onBack: () => Navigator.pop(context), 
        onClose: _toggleAuthMode
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40,),
                AuthHeader(isLogin: _isLogin),
                const SizedBox(height: 40,),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      if (!_isLogin)... [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: const Text(
                              'FULL NAME',
                              style: TextStyle(
                                color: Colors.white60,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5
                              ),
                              ),
                            ),
                            Card(
                              color: Colors.white10,
                              child: TextFormField(
                              controller: _nameController,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'John Doe',
                                hintStyle: TextStyle(color: Colors.white38, fontSize: 14),
                                prefixIcon: Icon(Icons.person_outline),
                                border: InputBorder.none
                              ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20,),
                      ],
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: const Text(
                              'EMAIL ADDRESS',
                              style: TextStyle(
                                color: Colors.white60,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5
                              ),
                            ),
                          ),
                          Card(
                            color: Colors.white10,
                            child: TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress, 
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText:  _isLogin ? 'name@example.com' : 'hello@pulse.com',
                                hintStyle: TextStyle(color: Colors.white38, fontSize: 14),
                                prefixIcon: const Icon(Icons.mail_outlined),
                                border: InputBorder.none
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter Your Email Address';
                                }
                                if (!value.contains('@')) {
                                  return 'Invalid Email';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: const Text(
                              'PASSWORD',
                              style: TextStyle(
                                color: Colors.white60,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5
                              ),
                            ),
                          ),
                          Card(
                            color: Colors.white10,
                            child: TextFormField(
                              controller: _passwordcontroller,
                              obscureText: _obscurePassword, 
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: '********',
                                prefixIcon: const Icon(Icons.lock_outline),
                                hintStyle: TextStyle(color: Colors.white38, fontSize: 14),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _obscurePassword = !_obscurePassword;
                                    });
                                  }, 
                                  icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility)
                                ),
                                border: InputBorder.none,
                              ),
                              validator: (value) {
                                if (value == null || value.length < 8) {
                                  return 'Password must be greater than 7 characters';
                                }
                                if (value != _passwordcontroller.text.trim()) {
                                  return 'Input correct password';
                                }
                                return null;
                              },
                            ),
                          ),
                          if (_isLogin)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {}, 
                                child: Text(
                                  'Forgot?',
                                  style: TextStyle(
                                    color: Color(0xFF4EE201)
                                  ),
                                )
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 32,),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(41, 153, 113, 245),
                              blurRadius: 20,
                              offset: const Offset(0, 5),
                            )
                          ]
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF9B7EED),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                            elevation: 0
                          ),
                          onPressed: _submitAuthForm, 
                          child: _isLoading ? CircularProgressIndicator(color: Color(0xFF1B0F3A), strokeWidth: 3,) : Text(
                            _isLogin ? 'Sign In' : 'Join Tixora',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1B0F3A)
                            ),
                          )
                        ),
                      ),
                      const SizedBox(height: 40,),
          
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
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          Expanded(child: Container(height: 1, color: const Color.fromARGB(29, 255, 255, 255))),
                        ],
                      ),
                      const SizedBox(height: 30,),
          
                      SocialButton(),
                      const SizedBox(height: 40,),
          
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
                          TextButton(
                            onPressed: _toggleAuthMode, 
                            child: Text(
                              _isLogin ? 'Join the Tixora' : 'Sign In',
                              style: TextStyle(
                                color: Color(0xFF4EE2D1)
                              ),
                            )
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
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}