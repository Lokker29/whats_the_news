class APIError implements Exception {
  final message = 'An error occurred while a request performs';
}

class APINotSuccessRequestError implements Exception {
  final message = 'Response status code is not 200';
}

class ConnectionError implements Exception {
  final message = 'Your device has some issues with the Internet connection';
}
