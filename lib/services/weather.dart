import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = "6b51f4094ae5e92a78d90500151607ea";
const weatherAPIURL = "https://api.openweathermap.org/data/2.5/weather";

class WeatherModel {
  double latitude;
  double longitude;

  Future<dynamic> getCityWeather(var cityName) async {
    print("******************");
    print(cityName);
    print("******************");
    String weatherURL = "$weatherAPIURL?q=$cityName&appid=$apiKey&units=metric";

    NetworkingHelper netHelper = NetworkingHelper(weatherURL);

    var weatherData = await netHelper.getData();

    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location loc = Location();
    await loc.getCurrentLocation();
    latitude = loc.latitude;
    longitude = loc.longitude;
    print(latitude);
    print(longitude);

    NetworkingHelper netHelper = NetworkingHelper(
        "$weatherAPIURL?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric");
    var weatherData = await netHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
