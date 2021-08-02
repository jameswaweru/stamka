class ApiResponse {
  int status;
  String message;
  dynamic data;
  int totalPages;
  int currentPage;
  int totalElements;

  ApiResponse({this.status, this.message, this.data});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    var list = json["data"] as dynamic;
    final data =  ApiResponse(
      status: json['status'],
        message: json['message'],
      data: list
    );
    return data;
  }

}