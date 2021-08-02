class GeneratedToken{
  String token;
  String token_type;
  int expires_in;

  GeneratedToken({this.token, this.token_type, this.expires_in});


  factory GeneratedToken.fromJson(Map<String, dynamic> json) {
    return GeneratedToken(
      token: json['token'],
      token_type: json['token_type'],
      expires_in: json['expires_in'],
    );
  }

}