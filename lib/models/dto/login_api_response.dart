import 'package:stamka/models/agent_details.dart';

class LoginApiReponse {
  int status;
  String message;
  AgentDetails data;

  LoginApiReponse({this.status, this.message, this.data});

  factory LoginApiReponse.fromJson(Map<String, dynamic> json) {
    return LoginApiReponse(
        status: json['status'],
        message: json['message'],
        data : AgentDetails.fromJson(json['data'])
    );
  }


}