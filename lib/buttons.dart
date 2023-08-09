import 'package:flutter/material.dart';
class Myutton extends StatelessWidget {
  
final function;
final icon;
Myutton({this.icon,this.function});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Colors.white,
          width: 50,
          height: 50,
          child: Center(child: Icon(icon)),
        ),
      ),
    );

  }
}
