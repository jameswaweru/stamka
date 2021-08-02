import 'dart:convert';

import '../models/dto/generated_token_model.dart';
import 'package:http/http.dart' as http;
import 'package:stamka/utils/app_configs.dart';

class TokenApis{


  Future<GeneratedToken> generateToken() async {
    final response = await http.post(
      Uri.parse(AppConfigs.base_url+"/api/v1/token"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Basic YXBwQ2xpZW50VXNlcjpjbGllbnRwYXNzd29yZA=='
      },
      body: jsonEncode(<String, dynamic>{
        'consumerKey': 's2xb83zVg26o63Q1p17gLgW7JYWs12',
        'consumerSecret': '5K8CyKXrZ6pORYTZARg770jyWu1x2Q2W71AvS0vqx10Xr2aGcU'
      }),
    );

    print("Calling this endpoint ..."+AppConfigs.base_url+"/api/v1/token");


    final parsed = json.decode(response.body);

    print("Response .."+response.toString());
    final dataJson = GeneratedToken.fromJson(parsed);
    return dataJson;
  }

}