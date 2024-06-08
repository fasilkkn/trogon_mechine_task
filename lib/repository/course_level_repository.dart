
import 'package:trogon_mechine_task/data/network/base_api_service.dart';
import 'package:trogon_mechine_task/data/network/network_api_service.dart';
import 'package:trogon_mechine_task/model/auth_model.dart';
import 'package:trogon_mechine_task/model/levels_by_course_model.dart';
import 'package:trogon_mechine_task/utils/app_url.dart';


class CourseLevelRepository{


  BaseApiServices apiServices = NetworkApiServices();

  Future<LevelsByCourse>courseLevel()async{

    try{
      dynamic response = await apiServices.getAPiResponse(AppUrl.levelsByCourse);
      return response = LevelsByCourse.fromJson(response);

    }catch(e){
      throw e;
    }
  }
}