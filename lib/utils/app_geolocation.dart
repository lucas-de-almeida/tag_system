import 'package:geolocator/geolocator.dart';

class AppGeolocation {
  Future<Position> getCurrentLocation() async {
    final position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return position;
  }
}
