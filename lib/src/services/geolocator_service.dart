import 'package:geolocator/geolocator.dart';

class GeolocatorServe {
  Future<Position> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    Position getLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      Geolocator.requestPermission();
      return getLocation;
    } else {
      return getLocation;
    }
  }
}
