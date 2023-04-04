
class RouteModel {
  RouteModel({
    required this.error,
    required this.message,
    required this.data,
  });

  bool error;
  String message;
  List<Routes> data;

  factory RouteModel.fromJson(Map<String, dynamic> json) => RouteModel(
    error: json["error"],
    message: json["message"],
    data: List<Routes>.from(json["data"].map((x) => Routes.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Routes {
  Routes({
    required this.id,
    required this.routeName,
    required this.serviceTime,
    required this.startsAt,
    required this.totalOrder,
    required this.started,
    required this.isStarted,
    this.lastStop,
    this.driverCurrentLocation,
    required this.approximateDrivingTime,
    required this.distance,
    required this.actualDrivingTime,
    required this.isRequestMaskPhoto,
    this.maskPhoto,
    required this.driverId,
    required this.dispatcherId,
  });

  int id;
  String routeName;
  String serviceTime;
  DateTime startsAt;
  int totalOrder;
  DateTime started;
  String isStarted;
  dynamic lastStop;
  dynamic driverCurrentLocation;
  String approximateDrivingTime;
  String distance;
  String actualDrivingTime;
  String isRequestMaskPhoto;
  dynamic maskPhoto;
  int driverId;
  int dispatcherId;

  factory Routes.fromJson(Map<String, dynamic> json) => Routes(
    id: json["id"],
    routeName: json["route_name"],
    serviceTime: json["service_time"],
    startsAt: DateTime.parse(json["starts_at"]),
    totalOrder: json["total_order"],
    started: DateTime.parse(json["started"]),
    isStarted: json["is_started"],
    lastStop: json["last_stop"],
    driverCurrentLocation: json["driver_current_location"],
    approximateDrivingTime: json["approximate_driving_time"],
    distance: json["distance"],
    actualDrivingTime: json["actual_driving_time"],
    isRequestMaskPhoto: json["is_request_mask_photo"],
    maskPhoto: json["mask_photo"],
    driverId: json["driver_id"],
    dispatcherId: json["dispatcher_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "route_name": routeName,
    "service_time": serviceTime,
    "starts_at": startsAt.toIso8601String(),
    "total_order": totalOrder,
    "started": started.toIso8601String(),
    "is_started": isStarted,
    "last_stop": lastStop,
    "driver_current_location": driverCurrentLocation,
    "approximate_driving_time": approximateDrivingTime,
    "distance": distance,
    "actual_driving_time": actualDrivingTime,
    "is_request_mask_photo": isRequestMaskPhoto,
    "mask_photo": maskPhoto,
    "driver_id": driverId,
    "dispatcher_id": dispatcherId,
  };
}
