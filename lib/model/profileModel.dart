
class ProfileModel {
  ProfileModel({
    this.id,
    this.name,
    this.email,
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
  String? phone;
  String? address;
  String? avatar;
  dynamic fcmId;
  dynamic otp;
  int? status;
  DateTime? createdAt;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    address: json["address"],
    avatar: json["avatar"],
    fcmId: json["fcm_id"],
    otp: json["otp"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "address": address,
    "avatar": avatar,
    "fcm_id": fcmId,
    "otp": otp,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
  };
}
