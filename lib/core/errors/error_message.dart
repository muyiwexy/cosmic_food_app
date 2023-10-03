enum ErrorType {
  notFound(404, 'Not found', 'we did not find your user ooh'),
  badRequest(401, 'Unauthorized', 'omo no vex you no get access'),
  unauthorized(400, 'Bad request', 'Invalid E-mail or Password'),
  serverError(500, 'Server error', 'our server don close'),
  noInternet(600, 'No Internet', '''Unable to connect to cloud server. 
  \nCheck your internet connection ''');

  const ErrorType(this.code, this.errorTitle, this.errorMessage);
  final int code;
  final String errorTitle;
  final String errorMessage;
}

ErrorType getErrorTypeFromStatusCode(int statusCode) {
  switch (statusCode) {
    case 404:
      return ErrorType.notFound;
    case 401:
      return ErrorType.unauthorized;
    case 400:
      return ErrorType.badRequest;
    case 500:
      return ErrorType.serverError;
    case 600:
      return ErrorType.serverError;
    default:
      return ErrorType.serverError;
  }
}
