import 'uri_helper.dart';

class AppEndPoint {
  final String baseUrl;
  final int port;

  AppEndPoint({required this.baseUrl, required this.port});

  Uri get(String endpoint) {
    return UriHelper.createUrl(
      host: baseUrl,
      port: port,
      path: "api/$endpoint",
    );
  }

  Uri getById(String endpoint, int id) {
    return UriHelper.createUrl(
      host: baseUrl,
      port: port,
      path: 'api/$endpoint/$id',
    );
  }

  Uri create(String endpoint) {
    return UriHelper.createUrl(
      host: baseUrl,
      port: port,
      path: 'api/$endpoint',
    );
  }

  Uri update(String endpoint, int id) {
    return UriHelper.createUrl(
      host: baseUrl,
      port: port,
      path: 'api/$endpoint/$id',
    );
  }

  Uri delete(String endpoint, int id) {
    return UriHelper.createUrl(
      host: baseUrl,
      port: port,
      path: 'api/$endpoint/$id',
    );
  }
}
