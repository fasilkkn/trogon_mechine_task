import 'package:flutter/cupertino.dart';
import 'package:trogon_mechine_task/data/response/api_response.dart';
import 'package:trogon_mechine_task/model/levels_by_course_model.dart';
import 'package:trogon_mechine_task/repository/course_level_repository.dart';



class CourseLevelViewModel with ChangeNotifier {

 final myRepository = CourseLevelRepository();

 ApiResponse<LevelsByCourse>courseLevel = ApiResponse.loading();

 setCourseLevel(ApiResponse<LevelsByCourse> response) {
  courseLevel = response;
  notifyListeners();
 }

 Future<void>fetchCourseLevelApi()async {

  setCourseLevel(ApiResponse.loading());

  myRepository.courseLevel().then((value) {
   setCourseLevel(ApiResponse.completed(value));
  }).onError((error, stackTrace) {
   setCourseLevel(ApiResponse.error(error.toString()));
  });
 }
 }