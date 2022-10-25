import '../constants.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import '../model/image_model.dart';

class ApiService {
  Future<Cat> getData() async {
    var url = Uri.parse(URL);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> jasonData =
          convert.jsonDecode(response.body) as List<dynamic>;

      final retData = jasonData[0];
      // print(jasonData[0]['url']);
      // print(jasonData[0]['id']);
      // print(jasonData[0]['height']);
      // print(jasonData[0]['width']);
      return Cat(
        height: retData['height'],
        id: retData['id'],
        url: retData['url'],
        width: retData['width'],
      );
    }
    throw Exception('Failed to load data');
  }
}
