class PaystackCheckoutResponse {
  final PaystackCheckoutData? data;

  PaystackCheckoutResponse({
    this.data,
  });

  PaystackCheckoutResponse copyWith({
    PaystackCheckoutData? data,
  }) =>
      PaystackCheckoutResponse(
        data: data ?? this.data,
      );

  factory PaystackCheckoutResponse.fromJson(Map<String, dynamic> json) =>
      PaystackCheckoutResponse(
        data: json["data"] == null
            ? null
            : PaystackCheckoutData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class PaystackCheckoutData {
  final String? reference;
  final String? paymentUrl;

  PaystackCheckoutData({
    this.reference,
    this.paymentUrl,
  });

  PaystackCheckoutData copyWith({
    String? reference,
    String? paymentUrl,
  }) =>
      PaystackCheckoutData(
        reference: reference ?? this.reference,
        paymentUrl: paymentUrl ?? this.paymentUrl,
      );

  factory PaystackCheckoutData.fromJson(Map<String, dynamic> json) =>
      PaystackCheckoutData(
        reference: json["reference"],
        paymentUrl: json["payment_url"],
      );

  Map<String, dynamic> toJson() => {
        "reference": reference,
        "payment_url": paymentUrl,
      };
}
