import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'image_list_model.dart';

class ServiceClass {
  Future<dynamic> getImageData() async {
    Response response = await http.get(
        Uri.parse("https://api.pexels.com/v1/search?query=people"),
        headers: {
          'Authorization':
              'dIglI8qTMXqnxjb8phO0x1KhExpwqSppnxffSL5WbWq6lC2ooQ1fmmYp',
          'Content-Type': 'application/json',
        });
    if (response.statusCode == 200) {
      var decodeData = jsonDecode(response.body);
      return ImagesListRes.fromJson(decodeData);
    } else {
      return null;
    }
  }
}
