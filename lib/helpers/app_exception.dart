class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
} //end class AppException

class FetchDataException extends AppException {
  FetchDataException([String message])
      : super(message, "Error During Communication");
} // end class FetchDataException

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
} // end class BadRequestException

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
} // end class UnauthorisedException

class UnporocessableEntityException extends AppException {
  UnporocessableEntityException([message])
      : super(message, "Unporocessable Entity: ");
} // end class UnporocessableEntityException

class InvalidInputException extends AppException {
  InvalidInputException([String message]) : super(message, "Invalid Input: ");
}
