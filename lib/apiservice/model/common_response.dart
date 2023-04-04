class CommonResponse {
  CommonResponse({required this.statusCode, required this.message});

  final int statusCode;
  final dynamic message;

  factory CommonResponse.fromJson(Map<String, dynamic> json) => CommonResponse(
        statusCode: json["statusCode"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
      };
}
