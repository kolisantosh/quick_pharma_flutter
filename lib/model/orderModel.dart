class OrderModel {
  OrderModel({
    this.error,
    this.message,
    this.total,
    required this.data,
  });

  bool? error;
  String? message;
  int? total;
  List<Orders> data;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
      error: json["error"],
      message: json["message"],
      total: json["total"],
      data: json["data"] == null ? [] : List<Orders>.from(json["data"]!.map((x) => Orders.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
  "error": error,
  "message": message,
  "total": total,
  "data": data == null ? [] : List<dynamic>.from(data.map((x) => x.toJson())),
};
}


class Orders {
  Orders({
    this.id,
    this.status,
    this.subStatus,
    this.userId,
    this.recipientId,
    this.driverId,
    this.dispatcherId,
    this.requestCallUponArrival,
    this.includeInsurance,
    this.orderTotalPrice,
    this.insuranceRate,
    this.deliveryMethodsType,
    this.specialInstructions,
    this.weight,
    this.items,
    this.copay,
    this.payout,
    this.orderType,
    this.orderCondition,
    this.subtypeFridge,
    this.storeInFridge,
    this.subtypeConfidential,
    this.subtypeSensitive,
    this.subtypeHazardous,
    this.subtypeControlled,
    this.subtypeWoundcare,
    this.documentsToSignByRecipient,
    this.dateToDeliver,
    this.timeToDeliver,
    this.timeWindowDeliveries,
    this.pickupDate,
    this.pickupTimeMin,
    this.pickupTimeMax,
    this.recipientEmailToOwner,
    this.operatorInitials,
    this.isSms,
    this.isCall,
    this.condition,
    this.facility,
    this.hub,
    this.contents,
    this.noteAdded,
    this.isCopayPayed,
    this.addedBy,
    this.attempts,
    this.orderActivity,
    this.latitude,
    this.longitude,
    this.address,
    this.orderSequence,
    this.createdAt,
    this.updatedAt,
    this.orderCreatedAt,
    this.recipient,
    this.client,
    this.prescriptions,
    this.orderDocument,
  });

  int? id;
  String? status;
  String? subStatus;
  int? userId;
  int? recipientId;
  int? driverId;
  int? dispatcherId;
  String? requestCallUponArrival;
  String? includeInsurance;
  String? orderTotalPrice;
  String? insuranceRate;
  String? deliveryMethodsType;
  String? specialInstructions;
  String? weight;
  String? items;
  String? copay;
  String? payout;
  String? orderType;
  String? orderCondition;
  String? subtypeFridge;
  String? storeInFridge;
  String? subtypeConfidential;
  String? subtypeSensitive;
  String? subtypeHazardous;
  String? subtypeControlled;
  String? subtypeWoundcare;
  String? documentsToSignByRecipient;
  int? dateToDeliver;
  dynamic timeToDeliver;
  String? timeWindowDeliveries;
  int? pickupDate;
  String? pickupTimeMin;
  String? pickupTimeMax;
  String? recipientEmailToOwner;
  String? operatorInitials;
  String? isSms;
  String? isCall;
  dynamic condition;
  dynamic facility;
  dynamic hub;
  dynamic contents;
  dynamic noteAdded;
  String? isCopayPayed;
  int? addedBy;
  int? attempts;
  dynamic orderActivity;
  String? latitude;
  String? longitude;
  String? address;
  int? orderSequence;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? orderCreatedAt;
  Ient? recipient;
  Ient? client;
  List<Prescription?>? prescriptions;
  List<dynamic>? orderDocument;

  factory Orders.fromJson(Map<String, dynamic> json) => Orders(
      id: json["id"],
      status: json["status"],
      subStatus: json["sub_status"],
      userId: json["user_id"],
      recipientId: json["recipient_id"],
      driverId: json["driver_id"],
      dispatcherId: json["dispatcher_id"],
      requestCallUponArrival: json["request_call_upon_arrival"],
      includeInsurance: json["include_insurance"],
      orderTotalPrice: json["order_total_price"],
      insuranceRate: json["insurance_rate"],
      deliveryMethodsType: json["delivery_methods_type"],
      specialInstructions: json["special_instructions"],
      weight: json["weight"],
      items: json["items"],
      copay: json["copay"],
      payout: json["payout"],
      orderType: json["order_type"],
      orderCondition: json["order_condition"],
      subtypeFridge: json["subtype_fridge"],
      storeInFridge: json["store_in_fridge"],
      subtypeConfidential: json["subtype_confidential"],
      subtypeSensitive: json["subtype_sensitive"],
      subtypeHazardous: json["subtype_hazardous"],
      subtypeControlled: json["subtype_controlled"],
      subtypeWoundcare: json["subtype_woundcare"],
      documentsToSignByRecipient: json["documents_to_sign_by_recipient"],
      dateToDeliver: json["date_to_deliver"],
      timeToDeliver: json["time_to_deliver"],
      timeWindowDeliveries: json["time_window_deliveries"],
      pickupDate: json["pickup_date"],
      pickupTimeMin: json["pickup_time_min"],
      pickupTimeMax: json["pickup_time_max"],
      recipientEmailToOwner: json["recipient_email_to_owner"],
      operatorInitials: json["operator_initials"],
      isSms: json["is_sms"],
      isCall: json["is_call"],
      condition: json["condition"],
      facility: json["facility"],
      hub: json["hub"],
      contents: json["contents"],
      noteAdded: json["note_added"],
      isCopayPayed: json["is_copay_payed"],
      addedBy: json["added_by"],
      attempts: json["attempts"],
      orderActivity: json["order_activity"],
      latitude: json["latitude"],
      longitude: json["longitude"],
      address: json["address"],
      orderSequence: json["order_sequence"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      orderCreatedAt: json["order_created_at"],
      recipient: Ient.fromJson(json["recipient"]),
      client: Ient.fromJson(json["client"]),
      prescriptions: json["prescriptions"] == null ? [] : List<Prescription?>.from(json["prescriptions"]!.map((x) => Prescription.fromJson(x))),
  orderDocument: json["order_document"] == null ? [] : List<dynamic>.from(json["order_document"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
  "id": id,
  "status": status,
  "sub_status": subStatus,
  "user_id": userId,
  "recipient_id": recipientId,
  "driver_id": driverId,
  "dispatcher_id": dispatcherId,
  "request_call_upon_arrival": requestCallUponArrival,
  "include_insurance": includeInsurance,
  "order_total_price": orderTotalPrice,
  "insurance_rate": insuranceRate,
  "delivery_methods_type": deliveryMethodsType,
  "special_instructions": specialInstructions,
  "weight": weight,
  "items": items,
  "copay": copay,
  "payout": payout,
  "order_type": orderType,
  "order_condition": orderCondition,
  "subtype_fridge": subtypeFridge,
  "store_in_fridge": storeInFridge,
  "subtype_confidential": subtypeConfidential,
  "subtype_sensitive": subtypeSensitive,
  "subtype_hazardous": subtypeHazardous,
  "subtype_controlled": subtypeControlled,
  "subtype_woundcare": subtypeWoundcare,
  "documents_to_sign_by_recipient": documentsToSignByRecipient,
  "date_to_deliver": dateToDeliver,
  "time_to_deliver": timeToDeliver,
  "time_window_deliveries": timeWindowDeliveries,
  "pickup_date": pickupDate,
  "pickup_time_min": pickupTimeMin,
  "pickup_time_max": pickupTimeMax,
  "recipient_email_to_owner": recipientEmailToOwner,
  "operator_initials": operatorInitials,
  "is_sms": isSms,
  "is_call": isCall,
  "condition": condition,
  "facility": facility,
  "hub": hub,
  "contents": contents,
  "note_added": noteAdded,
  "is_copay_payed": isCopayPayed,
  "added_by": addedBy,
  "attempts": attempts,
  "order_activity": orderActivity,
  "latitude": latitude,
  "longitude": longitude,
  "address": address,
  "order_sequence": orderSequence,
  "created_at": createdAt?.toIso8601String(),
  "updated_at": updatedAt?.toIso8601String(),
  "order_created_at": orderCreatedAt,
  "recipient": recipient!.toJson(),
  "client": client!.toJson(),
  "prescriptions": prescriptions == null ? [] : List<dynamic>.from(prescriptions!.map((x) => x!.toJson())),
  "order_document": orderDocument == null ? [] : List<dynamic>.from(orderDocument!.map((x) => x)),
};
}

class Ient {
  Ient({
    this.id,
    this.name,
    this.businessName,
    this.address,
    this.city,
    this.zip,
    this.state,
    this.apt,
    this.phone,
    this.deliveryAddress,
  });

  int? id;
  String? name;
  dynamic businessName;
  String? address;
  String? city;
  String? zip;
  String? state;
  String? apt;
  String? phone;
  String? deliveryAddress;

  factory Ient.fromJson(Map<String, dynamic> json) => Ient(
    id: json["id"],
    name: json["name"],
    businessName: json["business_name"],
    address: json["address"],
    city: json["city"],
    zip: json["zip"],
    state: json["state"],
    apt: json["apt"],
    phone: json["phone"],
    deliveryAddress: json["delivery_address"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "business_name": businessName,
    "address": address,
    "city": city,
    "zip": zip,
    "state": state,
    "apt": apt,
    "phone": phone,
    "delivery_address": deliveryAddress,
  };
}


class Prescription {
  Prescription({
    this.id,
    this.orderId,
    this.rxNumber,
    this.dateFilled,
  });

  int? id;
  int? orderId;
  String? rxNumber;
  DateTime? dateFilled;

  factory Prescription.fromJson(Map<String, dynamic> json) => Prescription(
    id: json["id"],
    orderId: json["order_id"],
    rxNumber: json["rx_number"],
    dateFilled: DateTime.parse(json["date_filled"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "order_id": orderId,
    "rx_number": rxNumber,
    "date_filled": "${dateFilled!.year.toString().padLeft(4, '0')}-${dateFilled!.month.toString().padLeft(2, '0')}-${dateFilled!.day.toString().padLeft(2, '0')}",
  };
}


class OrderDocument {
  OrderDocument({
    this.id,
    this.orderId,
    this.document,
    this.type,
    this.createdAt,
    this.documentPath,
    this.documentType,
  });

  int? id;
  int? orderId;
  String? document;
  int? type;
  DateTime? createdAt;
  String? documentPath;
  String? documentType;

  factory OrderDocument.fromJson(Map<String, dynamic> json) => OrderDocument(
    id: json["id"],
    orderId: json["order_id"],
    document: json["document"],
    type: json["type"],
    createdAt: DateTime.parse(json["created_at"]),
    documentPath: json["document_path"],
    documentType: json["document_type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "order_id": orderId,
    "document": document,
    "type": type,
    "created_at": createdAt?.toIso8601String(),
    "document_path": documentPath,
    "document_type": documentType,
  };
}

