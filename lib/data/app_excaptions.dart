class AppExcaptions implements Exception {
  final _message;
  final _prefix;

  AppExcaptions([this._message, this._prefix]);

  @override
  String toString() {
    // TODO: implement toString
    return '$_prefix$_message';
  }
}

class FetchDataExcaption extends AppExcaptions {
  FetchDataExcaption([String? message])
      : super(message, 'Error During Communication');
}

class BadRequestExcaption extends AppExcaptions {
  BadRequestExcaption([String? message]) : super(message, 'Invalid Request');
}

class UnauthorisedExcaption extends AppExcaptions {
  UnauthorisedExcaption([String? message])
      : super(message, 'Unauthorised Request');
}

class InvalidInputExcaption extends AppExcaptions {
  InvalidInputExcaption([String? message])
      : super(message, 'Invalid Input Request');
}
