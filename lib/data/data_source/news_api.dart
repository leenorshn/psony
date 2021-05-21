import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class NewsApi {
  final baseUrl =
      "https://newsapi.org/v2/top-headlines?country=fr&apiKey=c33f7cca08144575b25c27bba1761861";
  Future<Map<String, dynamic>?> getNews() async {
    try {
      var responseBody = await http.get(Uri.parse(baseUrl),
          headers: {"content-type": "application/json"});
      // File file = new File("articles.json");
      // file.writeAsString(responseBody.body, mode: FileMode.append);
      print(responseBody.body);
      if (responseBody.statusCode == 200) {
        return jsonDecode(responseBody.body);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
