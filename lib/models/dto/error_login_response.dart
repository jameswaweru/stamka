class ErrorLoginResponse {
  int status;
  String message;

  ErrorLoginResponse({this.status, this.message});

  factory ErrorLoginResponse.fromJson(Map<String, dynamic> json) {
    return ErrorLoginResponse(
        status: json['status'],
        message: json['message']
    );
  }

}