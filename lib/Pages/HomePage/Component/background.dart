import 'package:flutter/material.dart';

Widget backGround({required child}) {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.blue.shade200, Colors.blue.shade50],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
    child: child,
  );
}
