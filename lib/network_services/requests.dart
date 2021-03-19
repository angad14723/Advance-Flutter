import 'package:http/http.dart' as http;
import 'api_urls.dart';

class NetworkRequest {
  final String url;
  final dynamic body;

  NetworkRequest({this.url, this.body});

  Future<http.Response> post() async {
    return await http
        .post(Uri.http(urlBase, url), body: body)
        .timeout(Duration(seconds: 10));
  }

  Future<http.Response> get() async {
    return await http
        .get(Uri.http(urlBase, url))
        .timeout(Duration(seconds: 10))
        .then((value) {
      return value;
    });
  }
}
