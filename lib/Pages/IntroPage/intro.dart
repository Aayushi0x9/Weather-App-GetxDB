import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroPage extends StatefulWidget {
  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () {
      Get.offNamed('/logIn_page');
    });
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(
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
          // Sun and Clouds
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Sun
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
                // Clouds
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 60,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 10,
                            left: 20,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.white,
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 20,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.white,
                            ),
                          ),
                          Positioned(
                            top: 0,
                            left: 35,
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 10,
                            right: 10,
                            child: Container(
                              height: 25,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 30),
                    Container(
                      width: 100,
                      height: 60,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 10,
                            left: 20,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.white,
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 20,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.white,
                            ),
                          ),
                          Positioned(
                            top: 0,
                            left: 35,
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 10,
                            right: 10,
                            child: Container(
                              height: 25,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                // App title with 3D effect
                Text(
                  'Weatherly',
                  style: TextStyle(
                    fontSize: 48,
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
                // Subtitle
                Text(
                  'Your daily weather companion',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white70,
                    shadows: [
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 5.0,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
