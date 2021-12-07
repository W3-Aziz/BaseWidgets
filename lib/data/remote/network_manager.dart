import 'dart:io';

import 'package:base_widget/data/remote/api_constant.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class NetManager {
  static NetManager? _netManager;
  static Dio? _dio;
  static Map<String, dynamic>? header;
  static GetStorage? _storage;

  NetManager._instance();

  factory NetManager() {
    if (_netManager == null) {
      _setDefaultConfig();
      _netManager = NetManager._instance();
    }
    return _netManager!;
  }

  static void _setDefaultConfig() {
    var options = BaseOptions(
      baseUrl: ApiConstant.baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    _storage = GetStorage();
    _dio = Dio(options);

    /// Add Log interceptor
    _dio?.interceptors.add(LogInterceptor(responseBody: true));

    header = {
      HttpHeaders.authorizationHeader: 'Bearer your token here',
      HttpHeaders.contentTypeHeader: 'application/json',
    };
  }

  Future<Response> getRequest(String api, Map<String, dynamic> data) {
    return _dio!.request(api,
        data: data, options: Options(method: 'GET', headers: header));
  }

  Future<Response> postRequest(String api, Map<String, dynamic> data) {
    return _dio!.request(api,
        data: data, options: Options(method: 'POST', headers: header));
  }
}

/**
    import 'dart:io';
    import 'package:frisory_app/utils/url.dart';
    import 'package:http_parser/http_parser.dart';
    import 'package:http/http.dart' as http;

    class HttpsRequest {
    final String url;
    dynamic body;
    Map<String, dynamic> headerMap;
    Map<String, dynamic> query;

    HttpsRequest({this.url, this.headerMap, this.body});


    Future<http.Response> post() {
    return http
    .post(Uri.parse(urlBase + url), headers: headerMap, body: body)
    .timeout(Duration(minutes: 2));
    }

    Future<http.Response> get() {
    return http
    .get(Uri.parse(url), headers: headerMap)
    .timeout(Duration(minutes: 2));
    }

    Future<http.StreamedResponse> dataWithFile(File file) async {
    var uri = Uri.parse(urlBase + url);
    var request = new http.MultipartRequest('POST', uri);

    print("File path: " + file.path);

    request.files
    .add(await http.MultipartFile.fromPath('image', file.path));

    /*var stream = http.ByteStream(file.openRead());
    stream.cast();
    var length = await file.length();
    var multipartFile = new http.MultipartFile('image', stream, length);
    request.files.add(multipartFile);*/

    request.headers.addAll(headerMap);
    request.fields.addAll(body);

    return request.send();
    }
    }
 */
