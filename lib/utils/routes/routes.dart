import 'package:flutter/material.dart';
import 'package:trogon_mechine_task/utils/routes/routes_name.dart';
import 'package:trogon_mechine_task/view/course_detail_screen.dart';
import 'package:trogon_mechine_task/view/home_page.dart';


class Routes{

  static Route<dynamic> generateRoute(RouteSettings settings){

    switch (settings.name){

            case RoutesName.course:
        return MaterialPageRoute(builder: (BuildContext context)=>const HomePage());

      case RoutesName.courseDetail:
        return MaterialPageRoute(builder: (BuildContext context)=>const CourseDetail());



      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(child: Text('No Route defined'),
            ),
          );
        });
    }
  }
}