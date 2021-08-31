class ApiResult {
  bool isError;
  dynamic data;

  ApiResult({this.isError: false});

  @override
  String toString() {
    var s = isError ? 'error' : 'success';
    return 'ApiResult ($s) ${data.toString()}';
  }
}
