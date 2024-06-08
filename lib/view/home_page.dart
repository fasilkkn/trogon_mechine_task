import 'package:flutter/material.dart';
import 'package:trogon_mechine_task/utils/app_colors.dart';
import 'package:trogon_mechine_task/widgets/box.dart';
import 'package:trogon_mechine_task/widgets/course_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
      toolbarHeight: 240.0,
      flexibleSpace: Container(
        color: Colors.purple,
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const Text('Hi Good Morning!', style: TextStyle(color: Colors.white),),
             const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text('John', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                 CircleAvatar(child: Icon(Icons.person),),
               ],
             ),

             const SizedBox(height: 30,),

             Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                 color: Colors.black54,),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                  children: [
                   const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [   
                   Text('Selected Course', style: TextStyle(color: Colors.white),),
                   Text('Montessori', style: TextStyle(color: Colors.white, fontSize: 20 ),),
                   ],),
                
                   ElevatedButton(
                    onPressed: () {}, child: const Center(child: Text('Change'),))
                  ],
                ),
              ),
             ),
          ],),
        ),
      ),
    ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Box(
                  text: 'Exam',
                  child:  const Icon(Icons.book, size: 40, color: AppColors.whiteColor,),
                ),

                Box(
                  text: 'Practice',
                  child:  const Icon(Icons.book, size: 40, color: AppColors.whiteColor,),
                ),

                Box(
                  text: 'Materials',
                  child:  const Icon(Icons.book, size: 40, color: AppColors.whiteColor,),
                ),
              ],
            ),

            const SizedBox(height: 30,),
           const  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text('Courses', style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold
              ),),
               Text('See all'),
            ],),

            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CourseBox(text: 'KTET',),
                 CourseBox(text: 'LP/UP/HST',),
                  CourseBox(text: 'SET',),
              ],
            ),

             const SizedBox(height: 20,),

            Container(
              height: 100,
              width: double.infinity,
              color: AppColors.buttonColor,
              child: const Center(
                child: Padding( 
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    children: [
                      Expanded(child: Text('Practice With Previous Year Question Papers',
                      style: TextStyle(color: AppColors.whiteColor),)),
                      Icon(Icons.arrow_forward, color: AppColors.whiteColor,),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 30,),
            Text('Latest Test Series', style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold
              ),),

              SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.buttonColor),
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        children: [
                          Text('Exam 102 - Biology '),
                        ],
                      ),
                    ),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}