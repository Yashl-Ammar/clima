import 'package:climaa/services/location.dart';
import 'package:climaa/services/networking.dart';

const String apiKey = 'api key';
const String apiUrl = 'https://api.openweathermap.org/data/2.5/weather';
class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async {
    String url = '$apiUrl?q=$cityName&appid=$apiKey&units=metric';
    NetWorkHelper netWorkHelper = NetWorkHelper(url);

    var weatherData = await netWorkHelper.getData();

    return weatherData;
  }


  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    String url = '$apiUrl?lat=${location.getLatitude()}&lon=${location.getLongitude()}&appid=$apiKey&units=metric';
    NetWorkHelper netWorkHelper = NetWorkHelper(url);

    var decodedData = await netWorkHelper.getData();

    return decodedData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
