

 import 'package:flutter/cupertino.dart';
import 'package:trogon_mechine_task/data/response/api_response.dart';
import 'package:trogon_mechine_task/model/auth_model.dart';
import 'package:trogon_mechine_task/repository/course_repository.dart';


class CourseViewModel with ChangeNotifier{

 final myRepository = CourseRepository();

 ApiResponse<Auth>courseList =ApiResponse.loading();

 setCourseList(ApiResponse<Auth> response){
  courseList = response;
  notifyListeners();
 }

 Future<void>fetchCourseListApi()async{

  setCourseList(ApiResponse.loading());

  myRepository.courseList().then((value){
   setCourseList(ApiResponse.completed(value));
  }).onError((error, stackTrace){
   setCourseList(ApiResponse.error(error.toString()));
  });
 }
 }