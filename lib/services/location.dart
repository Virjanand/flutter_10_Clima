import 'package:geolocator/geolocator.dart';

class Location {
  double _longitude;
  double _latitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.lowest)
          .timeout(Duration(seconds: 5));
      _longitude = position.longitude;
      _latitude = position.latitude;
    } catch (e) {
      print(e);
    }
  }

  double get latitude => _latitude;

  double get longitude => _longitude;
}
