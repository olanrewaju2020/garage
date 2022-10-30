class ApiResponse<T> {
  T? data;
  String? message,status;
  bool hasError;
  bool isSuccessful;
  String? error;
  DateTime? timestamp;
  String? path;

  ApiResponse({required this.data, this.message, this.timestamp, this.isSuccessful=false, this.hasError=false, this.error,  this.status, this.path});

  factory ApiResponse.fromJson(Map<String, dynamic> json){
    return ApiResponse(
      data: json['data'],
      message: json['data'],
      status: json['status'],
      isSuccessful: json['status'] == "success" ? true : false,
      hasError: json['status']  == "success" ? false : true,
      error: json['data'],
    );
  }

  @override
  String toString() {
    return 'ApiResponse{data: $data, message: $message, status: $status, hasError: $hasError, isSuccessful: $isSuccessful, error: $error, timestamp: $timestamp, path: $path}';
  }
}