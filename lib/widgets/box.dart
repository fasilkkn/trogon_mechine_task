import 'package:flutter/material.dart';
import 'package:trogon_mechine_task/utils/app_colors.dart';

class Box extends StatelessWidget {
  Widget child;
  String text;
  Color color;
  Color color2;
 Box({super.key, required this.child, required this.text, required this.color, required this.color2});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
          child,
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 30,
              width: double.infinity,
              color: color2,
              child: Center(child: Text(text, style: TextStyle(color: AppColors.whiteColor),),),
            ),
            )

        ],)
    );
  }
}