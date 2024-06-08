import 'package:flutter/material.dart';
import 'package:trogon_mechine_task/utils/app_colors.dart';

class CourseBox extends StatelessWidget {
  String text;
   CourseBox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: AppColors.buttonColor,
        ),

        SizedBox(height: 10,),
        Text(text),
      ],
    );
  }
}