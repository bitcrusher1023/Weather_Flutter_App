import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  void getCurrentLocation() async {
    try {
      Position devicePosition = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = devicePosition.latitude;
      longitude = devicePosition.longitude;
    } catch (e) {
      print(e);
    }
  }
}
