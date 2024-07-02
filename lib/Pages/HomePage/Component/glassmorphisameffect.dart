import 'package:flutter/material.dart';

Widget glassMorphisamEffect({required child}) {
  return Container(
    height: 200,
    width: double.infinity,
    margin: EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.5),
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 5,
          blurRadius: 10,
          offset: Offset(0, 5),
        ),
      ],
    ),
    child: child,
  );
}
