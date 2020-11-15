import 'dart:convert';

import 'package:http/http.dart' as http;

class VerifyService {
  VerifyService._();

  factory VerifyService.getInstance() => _instance;
  static final VerifyService _instance = VerifyService._();

  Future<Map<String, dynamic>> verifyImage({String url}) async {
    try {
      final response = await http.post("https://dasavatar.herokuapp.com/image",
          body: json.encode({"image": url}));
      return _getResponse(response);
    } catch (e) {
      throw e;
    }
  }

  Future<Map<String, dynamic>> verifyCrowd({String url}) async {
    try {
      final response = await http.post("https://dasavatar.herokuapp.com/crowd",
          body: json.encode({"image": url}));
      return _getResponse(response);
    } catch (e) {
      throw e;
    }
  }

  Map<String, dynamic> _getResponse(http.Response response) {
    print("api service");
    print(response.statusCode.toString());
    print(response.body.toString());
    print(response.request.url.toString());
    final Map<String, dynamic> body = json.decode(response.body);
    return body;
  }
}
