import 'package:flutter/material.dart';

class MyCircularProgressIndicator extends StatelessWidget {
  final double size;
  final Color color;

  MyCircularProgressIndicator({super.key, this.size = 50.0, this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 30,
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(color),
          strokeWidth: 5.0,
        ),
      ),
    );
  }
}
