import 'dart:convert';

import 'package:stamka/models/dto/apiResponse.dart';
import 'package:stamka/models/service.dart';
import 'package:stamka/models/service_category.dart';
import 'package:http/http.dart' as http;
import 'package:stamka/utils/SharedPrefManager.dart';
import 'package:stamka/utils/app_configs.dart';

class StamkaServices{


  Future<List<Service>> fetchServicesInACategory(int categoryId) async {

    print("Fetch services ....api:"+AppConfigs.base_url+"api/v1/services");

    final response = await http.get(
      Uri.parse(AppConfigs.base_url+"/api/v1/services"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer '+SharedPrefManager.getGeneratedToken()
      },
    );

    print("Heeyy..");

    print("Calling this endpoint ..." + AppConfigs.base_url + "/api/v1/login");


    final parsed = json.decode(response.body);

    print("Status ..." + response.statusCode.toString() + "| body " +
        parsed.toString());

    print("Response .." + response.toString());

    final dataJson = ApiResponse.fromJson(parsed);

    var categoryList = dataJson.data as List;
    List<ServiceCategory> serviceCategories = categoryList.map((i) => ServiceCategory.fromJson(i)).toList();
    List<Service> services;

    for(var i=0;i<serviceCategories.length;i++){
      ServiceCategory category = serviceCategories[i];
      if(category.categoryID == categoryId){
        services = category.services;
      }
    }
    return services;
  }
}