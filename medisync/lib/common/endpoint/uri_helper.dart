class UriHelper {
  static createUrl({
    required String host,
    String? path,
    int? port,
    Map<String, dynamic>? querryParameters,
  }) {
    return Uri(
      scheme: 'http',
      host: host,
      port: port,
      path: path,
      queryParameters: querryParameters,
    );
  }
}
