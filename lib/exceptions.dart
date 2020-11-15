class APINotSuccessRequestError implements Exception {
  final message = 'Response status code is not 200';
}

class ConnectionError implements Exception {
  final message = 'Your device has some issues with the Internet connection';
}
