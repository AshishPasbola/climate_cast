import 'dart:convert';

import 'package:climate_app/model/weather.dart';
import 'package:http/http.dart' as http;
class WeatherServices{
  Future<Weather> fetchWeather(String city) async {
    String url="http://api.openweathermap.org/data/2.5/weather?q=$city,India&APPID=2eaf5a2231644709deff59801322a190";
    // String url='${ApiHelper().baseUrl}?q=$city,India&APPID=${ApiHelper().apiKey}';
    print("url===$url");
    http.Response response = await http.get(Uri.parse(url));
    print("response==${response.body}");

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Weather.fromJson(data);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}