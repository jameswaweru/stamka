import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stamka/models/dto/apiResponse.dart';
import 'package:http/http.dart' as http;
import 'package:stamka/models/dto/error_login_response.dart';
import 'package:stamka/models/dto/login_api_response.dart';
import 'package:stamka/utils/SharedPrefManager.dart';
import 'package:stamka/utils/app_configs.dart';

class AuthApis{

  Future<ApiResponse> registerAgent(String msisdn, String fName, String lName, String nationalId, String pin) async {
    final response = await http.post(
      Uri.parse(AppConfigs.base_url+"/api/v1/register"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer '+SharedPrefManager.getGeneratedToken()
      },
      body: jsonEncode(<String, dynamic>{
        'MSISDN': msisdn,
        'nationalID': nationalId,
        'firstName':fName,
        'lastName':lName,
        'pin':pin
      }),
    );

    print("Calling this endpoint ..."+AppConfigs.base_url+"/api/v1/register");


    final parsed = json.decode(response.body);

    print("Response .."+response.toString());
    final dataJson = ApiResponse.fromJson(parsed);
    return dataJson;
  }


  Future<LoginApiReponse> login(String msisdn, String pin) async {
    print("msisdn:" + msisdn + " | pin:" + pin);
    final response = await http.post(
      Uri.parse(AppConfigs.base_url + "/api/v1/login"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ' + SharedPrefManager.getGeneratedToken()
      },
      body: jsonEncode(<String, dynamic>{
        'MSISDN': msisdn,
        'pin': pin
      }),
    );

    print("Calling this endpoint ..." + AppConfigs.base_url + "/api/v1/login");


    final parsed = json.decode(response.body);

    print("Status ..." + response.statusCode.toString() + "| body " +
        parsed.toString());
    print("Response .." + response.toString());
    if (response.statusCode == 201) {
      final dataJson = LoginApiReponse.fromJson(parsed);
      return dataJson;
    } else {
      final errorDataJson = ErrorLoginResponse.fromJson(parsed);

      LoginApiReponse error = LoginApiReponse();
      error.status = errorDataJson.status;
      error.message = errorDataJson.message;

      return error;
    }
  }




}