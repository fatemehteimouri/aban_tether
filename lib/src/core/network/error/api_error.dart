class ApiError {
  final String message;
  final int? statusCode;
  final String? errorDetails;

  ApiError({required this.message, this.statusCode, this.errorDetails});

  @override
  String toString() {
    return 'ApiError(message: $message, statusCode: $statusCode, errorDetails: $errorDetails)';
  }
}
