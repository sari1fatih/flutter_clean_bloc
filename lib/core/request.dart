import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'constants/url_info_constant.dart';

class Request {
  Future<Response> post(String path, dynamic data) async {
    final response = await http.post(
      Uri.parse(UrlInfoConstant.url + path),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: json.encode(data),
    );
    return response;
  }

  Future<Response> get(String path, dynamic data) async {
    final response = await http.get(Uri.parse(UrlInfoConstant.url + path),
        headers: {'Content-Type': 'application/json; charset=UTF-8'});
    return response;
  }
}
