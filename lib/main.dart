import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trogon_mechine_task/utils/routes/routes.dart';
import 'package:trogon_mechine_task/utils/routes/routes_name.dart';
import 'package:trogon_mechine_task/view/avigation_screen.dart';
import 'package:trogon_mechine_task/view/home_page.dart';
import 'package:trogon_mechine_task/view_model/course_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        ChangeNotifierProvider(create: (_)=>CourseViewModel()),
      ],
        child: 
     MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Poppins",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
            initialRoute: RoutesName.course,
            onGenerateRoute: Routes.generateRoute,
    ));
  }
}

