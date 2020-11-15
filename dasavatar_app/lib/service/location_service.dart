import 'package:dasavatar_app/model/address.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  LocationService._();

  factory LocationService.getInstance() => _instance;
  static final LocationService _instance = LocationService._();

  Future<Position> getLatLong() async {
    Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best)
        .timeout(Duration(seconds: 10), onTimeout: () {
      return null;
    });
    return position;
  }

  Future<Address> getAddressFromLatLon(
      double latitude, double longitude) async {
    List<Placemark> p = await placemarkFromCoordinates(latitude, longitude);
    Placemark place = p[0];
    Address address = Address.fromJson(place.toJson());
    address.latitude = latitude.toString();
    address.longitude = longitude.toString();
    return address;
  }

  Future<Address> getCurrentLocationAddress() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.best)
          .timeout(Duration(seconds: 10), onTimeout: () {
        return null;
      });
      if (position != null) {
        List<Placemark> p = await placemarkFromCoordinates(
            position.latitude, position.longitude);
        Placemark place = p[0];
        Address address = Address.fromJson(place.toJson());
        address.latitude = position.latitude.toString();
        address.longitude = position.longitude.toString();
        return address;
      }
      return null;
    } catch (e) {
      print("error in get location");
      print(e);
      return null;
    }
  }
}
