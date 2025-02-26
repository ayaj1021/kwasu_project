class BaseResponse<T> {
  final bool status;
  final String? message;
  final T? data;

  BaseResponse({
    required this.status,
    this.message,
    this.data,
  });

  factory BaseResponse.fromMap(Map<String, dynamic> json) => BaseResponse<T>(
        status: json["status"],
        message: json["message"] != null && json["message"] != null
            ? json["message"]
            : '',
        data: json["data"],
      );

  @override
  String toString() =>
      'BaseResponse(success: $status, message: $message, data: $data)';
}
