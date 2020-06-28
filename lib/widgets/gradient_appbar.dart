import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

class GradientAppBar extends StatelessWidget {
  final String title;
  final double barHeight;
  final Color color1;
  final Color color2;
  final Widget action;

  GradientAppBar({
    @required this.title,
    this.barHeight: 54.0,
    @required this.color1,
    @required this.color2,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    final double statusbarHeight = MediaQuery.of(context).padding.top;

    return new Container(
      padding: EdgeInsets.only(top: statusbarHeight),
      height: statusbarHeight + barHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 4,
          ),
          IconButton(
            icon: Icon(Feather.chevron_left),
            onPressed: () => navigator.pop(),
            color: Colors.white,
          ),
          SizedBox(
            width: 4,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.white,
              letterSpacing: 3,
              fontFamily: "Riviera",
            ),
          ),
          Expanded(
            child: Container(),
          ),
          action,
          SizedBox(
            width: 4,
          ),
        ],
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.5, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
    );
  }
}
