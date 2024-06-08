import 'package:flutter/material.dart';
import 'package:trogon_mechine_task/utils/app_colors.dart';

class CourseBox extends StatelessWidget {
  String text;
  Color color;
  Widget child;
   CourseBox({super.key, required this.text, required this.color, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: color,
          child: Center(child: child,),
        ),

        const SizedBox(height: 10,),
        Text(text),
      ],
    );
  }
}