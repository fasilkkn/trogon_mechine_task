import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trogon_mechine_task/data/response/status.dart';
import 'package:trogon_mechine_task/model/day_model.dart';
import 'package:trogon_mechine_task/model/levels_by_course_model.dart';
import 'package:trogon_mechine_task/utils/app_colors.dart';
import 'package:trogon_mechine_task/view_model/course_level_view_model.dart';
import 'package:trogon_mechine_task/widgets/day_box.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({super.key});

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {

 final List<DayInfo> days = [
    DayInfo(dayNumber: 1, date: '01/04', isActive: false, isLocked: false),
    DayInfo(dayNumber: 2, date: '02/04', isActive: false, isLocked: false),
    DayInfo(dayNumber: 3, date: '03/03', isActive: true, isLocked: false),
    DayInfo(dayNumber: 4, date: '04/04', isActive: false, isLocked: true),
    // Add more days as needed
  ];

    CourseLevelViewModel courseLevelViewModel = CourseLevelViewModel();

  @override
  void initState() {
    courseLevelViewModel.fetchCourseLevelApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 280.0,
          flexibleSpace: Container(
            color: AppColors.buttonColor,
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  const Row(
                    children: [
                      Icon(Icons.arrow_back, color: AppColors.whiteColor,),
                      SizedBox(width: 50,),
                      Text(
                        'Course Name',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20,),
                  
                  SizedBox(
                    height: 200,
                    child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: ListView.builder(
                                  physics: const AlwaysScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: days.length,
                                  itemBuilder: (context, index) {
                                    return DayWidget(dayInfo: days[index]);
                                  },
                                ),
                              ),
                  ),
                ],
              ),
            ),
          ),
        ),
      
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Container(
                          height: 100,
                          width: double.infinity,
                          color: AppColors.yellowlight,
                          child:  Center(
                            child: Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Row(
                                children: [
                                  const Expanded(
                                      child: Text(
                                    'Upgrade and unlock the full course',
                                    style: TextStyle(color: AppColors.blackColor),
                                  )),

                                  const SizedBox(width: 10,),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(backgroundColor: AppColors.buttonColor),
                                    onPressed: () {}, child: const Center(
                                    child: Text('Upgrade', style: TextStyle(color: AppColors.whiteColor),),
                                  ))
                                ],
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20,),

                        ChangeNotifierProvider<CourseLevelViewModel>(
          create: (BuildContext context) => courseLevelViewModel,
          child: Consumer<CourseLevelViewModel>(builder: (context, value, _) {
            switch (value.courseLevel.status) {
              case Status.Loading:
                return const Center(child: CircularProgressIndicator());

              case Status.Error:
                return Center(child: Text(value.courseLevel.message.toString()));

              case Status.Completed:
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView.builder(
                    itemCount: value.courseLevel.data!.data.length,
                    itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(value.courseLevel.data!.data[index].title),
                    );
                  })
                );
              case null:
 
            }
            return Container();
          }),
        )
          ],
        ),
      ),
      
      
    
    );
  }
}