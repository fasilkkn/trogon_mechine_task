import 'package:flutter/material.dart';
import 'package:trogon_mechine_task/utils/app_colors.dart';

class SeriesBox extends StatelessWidget {
  Color color;
 SeriesBox({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: color),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Exam 102 - Biology', style: TextStyle(color: AppColors.whiteColor),),
                           const Text('10 Questions   120 mins', style: TextStyle(color: AppColors.whiteColor),),

                           const SizedBox(height: 20,),
                           ElevatedButton(onPressed: () {}, child: Center(child: Text('Attempt Now'),))
                        ],
                      ),
                    ),
                  );
  }
}