
class DashBoardModel {
  DashBoardModel({
    this.error,
    this.message,
    this.data,
  });

  bool? error;
  String? message;
  DashBoard? data;

  factory DashBoardModel.fromJson(Map<String, dynamic> json) => DashBoardModel(
    error: json["error"],
    message: json["message"],
    data: DashBoard.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "data": data!.toJson(),
  };
}

class DashBoard {
  DashBoard({
    this.totalOrdersToday,
    this.totalOrdersThisMonth,
    this.totalOrdersPending,
    this.totalOrdersComplete,
    this.totalEarningsMonth,
  });

  int? totalOrdersToday;
  int? totalOrdersThisMonth;
  int? totalOrdersPending;
  int? totalOrdersComplete;
  int? totalEarningsMonth;

  factory DashBoard.fromJson(Map<String, dynamic> json) => DashBoard(
    totalOrdersToday: json["total_orders_today"]??0,
    totalOrdersThisMonth: json["total_orders_this_month"]??0,
    totalOrdersPending: json["total_orders_pending"]??0,
    totalOrdersComplete: json["total_orders_complete"]??0,
    totalEarningsMonth: json["total_earnings_this_month"]??0,
  );

  Map<String, dynamic> toJson() => {
    "total_orders_today": totalOrdersToday,
    "total_orders_this_month": totalOrdersThisMonth,
    "total_orders_pending": totalOrdersPending,
    "total_orders_complete": totalOrdersComplete,
    "total_earnings_this_month": totalEarningsMonth,
  };
}
