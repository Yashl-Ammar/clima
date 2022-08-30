import 'package:geolocator/geolocator.dart';


class Location{

  double? _longitude;
  double? _latitude;

  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      _longitude = position.longitude;
      _latitude = position.latitude;
    }catch(e){
      print(e);
    }
  }

  double getLatitude()
  {
    return _latitude??0;
  }

  double getLongitude()
  {
    return _latitude??0;
  }
}