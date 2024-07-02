import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blueAccent,
                  Colors.lightBlueAccent,
                ],
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // App Logo
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.yellowAccent,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.yellow.withOpacity(0.6),
                            spreadRadius: 10,
                            blurRadius: 20,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                    // Login Title
                    const Text(
                      'Welcome Back!',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            offset: Offset(3.0, 3.0),
                            blurRadius: 10.0,
                            color: Colors.black38,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    // Username TextField
                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Username',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                      ),
                      onChanged: (value) {
                        // Trigger validation or other logic if needed
                      },
                    ),
                    SizedBox(height: 20),
                    // Password TextField
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                      ),
                      onChanged: (value) {
                        // Trigger validation or other logic if needed
                      },
                    ),
                    SizedBox(height: 30),
                    // Login Button
                    ElevatedButton(
                      onPressed: () {
                        // Perform login action and add validation
                        if (_usernameController.text.isEmpty ||
                            _passwordController.text.isEmpty) {
                          Get.snackbar(
                              'Error', 'Please enter username and password',
                              snackPosition: SnackPosition.BOTTOM);
                        } else {
                          Get.snackbar('Success', 'Logging in...',
                              snackPosition: SnackPosition.BOTTOM);
                          Get.offNamed('/home_page');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.yellow.withOpacity(0.5),
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 80.0,
                          vertical: 15.0,
                        ),
                      ),
                      child: const Text(
                        'LOGIN',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Forgot Password
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Sign Up
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account?',
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.yellowAccent,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
