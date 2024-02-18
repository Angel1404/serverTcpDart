class ResponseSocket {
  final String message;
  final bool success;

  ResponseSocket({required this.message, required this.success});

  Map<String, dynamic> toJson() {
    return {
      "message": message,
      "success": success,
    };
  }
}
