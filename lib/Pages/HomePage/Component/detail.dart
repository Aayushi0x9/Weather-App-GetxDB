import 'package:flutter/material.dart';

Widget Detail({required child}) {
  return Container(
    height: 300,
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.5),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    child: child,
  );
}
