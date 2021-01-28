import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkingHelper {
  final String urlString;

  NetworkingHelper(this.urlString);

  Future getData() async {
    http.Response weatherResponse = await http.get(urlString);

    if (weatherResponse.statusCode == 200) {
      String weatherData = weatherResponse.body;
      return jsonDecode(weatherData);
    } else {
      print(weatherResponse.statusCode);
    }
  }
}
