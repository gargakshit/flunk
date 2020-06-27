import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class ParallelogramButton extends StatelessWidget {
  final Function onTap;
  final double width;
  final double height;
  final Widget child;

  ParallelogramButton({
    @required this.child,
    @required this.onTap,
    this.width = 260,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Parallelogram(
        cutLength: 20.0,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                gradient1Left,
                gradient1Right,
              ],
            ),
          ),
          height: height,
          width: width,
          child: child,
        ),
      ),
    );
  }
}
