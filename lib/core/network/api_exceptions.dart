class ApiException implements Exception {
  final String message;

  ApiException(this.message);
}

class NoInternetException extends ApiException {
  NoInternetException([super.message = 'No Internet Connection']);
}

class FetchDataException extends ApiException {
  FetchDataException([super.message = 'Error During Communication']);
}

class BadRequestException extends ApiException {
  BadRequestException([super.message = 'Invalid Request']);
}

class UnauthorisedException extends ApiException {
  UnauthorisedException([String message = 'Unauthorised']) : super(message);
}
