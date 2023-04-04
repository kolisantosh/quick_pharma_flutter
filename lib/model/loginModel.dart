
class LoginModel {
  LoginModel({
    this.error,
    this.message,
    this.token,
    this.data,
  });

  bool? error;
  String? message;
  String? token;
  UserData? data;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    error: json["error"],
    message: json["message"],
    token: json["token"]!=null?json["token"]:null,
    data: json["data"]!=null?UserData.fromJson(json["data"]):null,
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "token": token,
    "data": data!.toJson(),
  };

}

class UserData {
  UserData({
    this.id,
    this.name,
    this.email,
    this.username,
    this.phone,
    this.address,
    this.avatar,
    this.fcmId,
    this.otp,
    this.status,
    this.createdAt,
  });

  int? id;
  String? name;
  String? email;
  String? username;
  String? phone;
  String? address;
  String? avatar;
  dynamic fcmId;
  dynamic otp;
  int? status;
  DateTime? createdAt;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    id: json["id"],
    name: json["name"]??"",
    email: json["email"]??"",
    username: json["username"]??"",
    phone: json["phone"]??"",
    address: json["address"]??"",
    avatar: json["avatar"]??"",
    fcmId: json["fcm_id"]??"",
    otp: json["otp"]??"",
    status: json["status"]??"",
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "username": username,
    "phone": phone,
    "address": address,
    "avatar": avatar,
    "fcm_id": fcmId,
    "otp": otp,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
  };
}
