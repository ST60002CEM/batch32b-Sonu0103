import 'package:finalproject/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:finalproject/features/auth/domain/entity/auth_entity.dart';

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({super.key});

  @override
  ConsumerState<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fnameController =
      TextEditingController(text: 'Sonu');
  final TextEditingController _lnameController =
      TextEditingController(text: 'Singh');
  final TextEditingController _emailController =
      TextEditingController(text: 'sonu@gmail.com');
  final TextEditingController _passwordController =
      TextEditingController(text: 'test');
  final TextEditingController _confirmPasswordController =
      TextEditingController(text: 'test');

  final GoogleSignIn _googleSignIn = GoogleSignIn();

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
  void dispose() {
    _fnameController.dispose();
    _lnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(20, 50, 100, 1),
        title: const Text(
          'Foodie',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: const Color.fromRGBO(30, 94, 209, 1),
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
                  controller: _fnameController,
                  decoration: const InputDecoration(
                    labelText: 'First Name',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _lnameController,
                  decoration: const InputDecoration(
                    labelText: 'Last Name',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
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
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _confirmPasswordController,
                  decoration: const InputDecoration(
                    labelText: 'Confirm Password',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Perform signup action
                      var user = AuthEntity(
                        fname: _fnameController.text,
                        lname: _lnameController.text,
                        email: _emailController.text,
                        password: _passwordController.text,
                      );
                      ref
                          .read(authViewModelProvider.notifier)
                          .registerUser(user);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Signing up')),
                      );
                    }
                  },
                  child: const Text('Sign Up'),
                ),
                const SizedBox(height: 40),
                ElevatedButton.icon(
                  onPressed: _handleGoogleSignIn,
                  icon: Image.asset(
                    'assets/images/google.png', // Ensure you have a Google logo asset
                    height: 24.0,
                    width: 24.0,
                  ),
                  label: const Text('Sign Up with Google'),
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
                  label: const Text('Sign Up with Facebook'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Facebook blue
                    minimumSize: const Size(double.infinity, 50), // Button size
                    side:
                        const BorderSide(color: Colors.black), // Button border
                  ),
                ),
                const SizedBox(height: 10),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Login',
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
}
