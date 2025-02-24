class BaseResponse<T> {
  final bool success;
  final String? message;
  final T? data;

  BaseResponse({
    required this.success,
    this.message,
    this.data,
  });

  factory BaseResponse.fromMap(Map<String, dynamic> json) => BaseResponse<T>(
        success: json["success"],
        message: json["message"] != null && json["message"]["desc"] != null
            ? json["message"]["desc"]
            : '',
        data: json["data"],
      );

  @override
  String toString() =>
      'BaseResponse(success: $success, message: $message, data: $data)';
}
