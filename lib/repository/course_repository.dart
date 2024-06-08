
import 'package:trogon_mechine_task/data/network/base_api_service.dart';
import 'package:trogon_mechine_task/data/network/network_api_service.dart';
import 'package:trogon_mechine_task/model/auth_model.dart';
import 'package:trogon_mechine_task/utils/app_url.dart';


class CourseRepository{


  BaseApiServices apiServices = NetworkApiServices();

  Future<Auth>courseList()async{

    try{
      dynamic response = await apiServices.getAPiResponse(AppUrl.baseUrl);
      return response = Auth.fromJson(response);

    }catch(e){
      throw e;
    }
  }
}