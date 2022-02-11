class AppException implements Exception {
  final String? message;
  final String? prefix;
  final String? url;
  AppException({
    required this.message,
     this.prefix,
     this.url,
  });
}

class BadRequestException extends AppException {
  BadRequestException(String decode, String string, 
      { String? message,  String? prefix,  String? url})
      : super(message: message, prefix: 'Bad Requrst', url: url);
}
class FatchDataException extends AppException {
  FatchDataException(String s, String string, 
      { String? message,  String? prefix,  String? url})
      : super(message: message, prefix: 'Unable to load', url: url);
}
class ApiNotRespondingException extends AppException {
  ApiNotRespondingException(String s, String string, 
      { String? message,  String? prefix,  String? url})
      : super(message: message, prefix: 'Api not responding', url: url);
}
class UnAuthorizedException extends AppException {
  UnAuthorizedException(
      { String? message,  String? prefix,  String? url})
      : super(message: message, prefix: 'Unauthorized exception', url: url);
}