class NetworkError {
  String timestamp;
  int status;
  String error;
  String path;


  NetworkError(this.timestamp, this.status, this.error, this.path);


  @override
  String toString() {
    return 'NetworkError{errorMessage: $error, status: $status, path: $path, timestamp: $timestamp }';
  }
}