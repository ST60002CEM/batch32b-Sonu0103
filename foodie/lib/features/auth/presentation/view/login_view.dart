import 'package:finalproject/features/auth/presentation/view/register_view.dart';
import 'package:finalproject/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController =
      TextEditingController();
  final TextEditingController _passwordController =
      TextEditingController();

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  bool _isPasswordVisible = false;

  Future<void> _handleGoogleSignIn() async {
    try {
      await _googleSignIn.signIn();
      // Handle successful login here
    } catch (error) {
      // Handle login error here
    }
  }

  Future<void> _handleFacebookSignIn() async {
    try {
      final result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        // Handle successful login here
      } else {
        // Handle login error here
      }
    } catch (error) {
      // Handle login error here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(20, 50, 100, 1),
        title: Text(
          'Foodie',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Color.fromRGBO(30, 94, 209, 1),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/logo2.png',
                  height: 250, // Adjust the height as needed
                ),
                const SizedBox(height: 20),
                TextFormField(
                  key: const ValueKey('email'),
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  key: const ValueKey('password'),
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),
                  ),
                  obscureText: !_isPasswordVisible,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Handle forgot password here
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async{
                    await ref.read(authViewModelProvider.notifier).loginUser(
                      _emailController.text,
                      _passwordController.text,
                    );
                  },
                  child: const Text('Login'),
                ),
                const SizedBox(height: 40),
                ElevatedButton.icon(
                  onPressed: _handleGoogleSignIn,
                  icon: Image.asset(
                    'assets/images/google.png', // Ensure you have a Google logo asset
                    height: 24.0,
                    width: 24.0,
                  ),
                  label: const Text('Login with Google'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white, // Button text color
                    minimumSize: const Size(double.infinity, 50), // Button size
                    side:
                        const BorderSide(color: Colors.black), // Button border
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: _handleFacebookSignIn,
                  icon: const Icon(Icons.facebook, color: Colors.blue),
                  label: const Text('Login with Facebook'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Facebook blue
                    minimumSize: const Size(double.infinity, 50),
                    side: const BorderSide(color: Colors.black), // Button size
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => const RegisterView()));
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      await ref.read(authViewModelProvider.notifier).loginUser(
            _emailController.text,
            _passwordController.text,
          );
    }
  }
}
