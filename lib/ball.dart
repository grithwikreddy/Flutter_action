import 'package:flutter/material.dart';

class Ball extends StatelessWidget {

  final double ballx;
  final double bally;
  Ball({required this.ballx,required this.bally});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(ballx,bally),
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(shape: BoxShape.circle,
        color: Colors.white60,),
      ),
    );
  }
}
