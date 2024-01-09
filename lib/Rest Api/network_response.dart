class NetworkResponse {
  final int? statusCode;
  final bool isSuccess;
  final dynamic jsonResponse;
  final String errorMessage;

  NetworkResponse({
    this.statusCode = -1,
    required this.isSuccess,
    this.jsonResponse,
    this.errorMessage = "Something went wrong!",
  }) {
    if (!isSuccess) {
      print('Raw JSON Response on Error: $jsonResponse');
    }
  }
  factory NetworkResponse.fromJson(Map<String, dynamic> json) {
    return NetworkResponse(
      statusCode: json['statusCode'],
      isSuccess: json['status'] == 'success',
      jsonResponse: json['data'],
      errorMessage: json['message'] ?? "Something went wrong!",
    );
  }
}
