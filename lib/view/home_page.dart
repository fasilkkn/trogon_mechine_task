import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trogon_mechine_task/utils/app_colors.dart';
import 'package:trogon_mechine_task/view_model/course_view_model.dart';
import 'package:trogon_mechine_task/widgets/box.dart';
import 'package:trogon_mechine_task/widgets/course_box.dart';
import 'package:trogon_mechine_task/widgets/series_box.dart';

import '../data/response/status.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  CourseViewModel courseViewModel = CourseViewModel();

  @override
  void initState() {
    courseViewModel.fetchCourseListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
        final course =Provider.of<CourseViewModel>(context);
    return Scaffold(
      appBar : AppBar(
      toolbarHeight: 240.0,
      flexibleSpace: Container(
        color:  AppColors.buttonColor,
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
                 color: AppColors.whiteColor,),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                  children: [
                   const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [   
                   Text('Selected Course', style: TextStyle(color: AppColors.blackColor),),
                   Text('Montessori', style: TextStyle(color: AppColors.blackColor, fontSize: 20 ),),
                   ],),
                
                   ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: AppColors.buttonColor),
                    onPressed: () {}, child: const Center(child: Text('Change', style: TextStyle(color: AppColors.whiteColor),),))
                  ],
                ),
              ),
             ),
          ],),
        ),
      ),
    ),
      body: 
      ChangeNotifierProvider<CourseViewModel>(
        create: (BuildContext context)=>courseViewModel,
        child: Consumer<CourseViewModel>(
          builder: (context,value,_){

            switch(value.courseList.status){
              case Status.Loading:
                return Center(child: const CircularProgressIndicator());

              case Status.Error:
                return  Center(child: Text(value.courseList.message.toString()));

              case Status.Completed:
                return 
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Box(
                  text: 'Exam',
                  color: AppColors.examColor,
                  color2: AppColors.examColorBottom,
                  child:  const Icon(Icons.book, size: 40, color: AppColors.whiteColor,
                  ),
                ),

                Box(
                  text: 'Practice',
                  color: AppColors.practiceColor,
                  color2: AppColors.practiceColorBottom,
                  child:  const Icon(Icons.done_all_rounded, size: 40, color: AppColors.whiteColor,),
                ),

                Box(
                  text: 'Materials',
                  color: AppColors.materialsColor,
                  color2: AppColors.materialsColorBottom,
                  child:  const Icon(Icons.bookmarks, size: 40, color: AppColors.whiteColor,),
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
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Number of items per row
            mainAxisSpacing: 20.0, // Spacing between rows
            crossAxisSpacing: 10.0, // Spacing between columns
            childAspectRatio: 3 / 3, // Width to height ratio of each grid item
                      ),
                      itemCount:  value.courseList.data!.data.userdata.courseName.length,
                      itemBuilder: (context, index) {
            return   CourseBox(text: value.courseList.data!.data.userdata.courseName, color: AppColors.examColor, child: const Icon(Icons.people_alt_outlined),);
                    
                      },
                    ),
      
      

             const SizedBox(height: 30,),

            Container(
              height: 100,
              width: double.infinity,
              color: AppColors.yellowlight,
              child: const Center(
                child: Padding( 
                  padding:  EdgeInsets.all(30.0),
                  child: Row(
                    children: [
                      Expanded(child: Text('Practice With Previous Year Question Papers',
                      style: TextStyle(color: AppColors.blackColor),)),
                      Icon(Icons.arrow_forward, color: AppColors.blackColor,),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30,),
            const Text('Latest Test Series', style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold
              ),),

              const SizedBox(height: 20,),
               SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SeriesBox(color: AppColors.examColorBottom,),
                
                    const SizedBox(width: 10,),
                      SeriesBox(color: AppColors.practiceColor,),
                
                    const SizedBox(width: 10,),
                      SeriesBox(color: AppColors.materialsColor,),
                
                    const SizedBox(width: 10,),
                      SeriesBox(color: AppColors.examColor,),
                
                    const SizedBox(width: 10,),
                  ],
                ),
              )
          ],
        ),
      );
              case null:
                // TODO: Handle this case.
            } return Container();
            }),
    ));
  }
}