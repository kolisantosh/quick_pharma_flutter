
class EarningModel {
  EarningModel({
    this.error,
    this.message,
    this.totalPayout,
    required this.data,
  });

  bool? error;
  String? message;
  String? totalPayout;
  List<Earning> data;

  factory EarningModel.fromJson(Map<String, dynamic> json) => EarningModel(
    error: json["error"],
    message: json["message"]??"",
    totalPayout: json["total_payout"]??"",
    data: json["data"] == null ? [] : List<Earning>.from(json["data"].map((x) => Earning.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "total_payout": totalPayout,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Earning {
  Earning({
    required this.date,
    required this.payout,
  });

  DateTime date;
  int payout;

  factory Earning.fromJson(Map<String, dynamic> json) => Earning(
    date: DateTime.parse(json["Date"]),
    payout: json["Payout"],
  );

  Map<String, dynamic> toJson() => {
    "Date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "Payout": payout,
  };
}
