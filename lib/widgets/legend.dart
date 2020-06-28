import 'package:flutter/material.dart';

class Legand extends StatelessWidget {
  final LinearGradient gradient;
  final String text;

  Legand({
    @required this.gradient,
    @required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 32,
          height: 24,
          decoration: BoxDecoration(
            gradient: gradient,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 40,
            top: 2,
          ),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ),
      ],
    );
  }
}
