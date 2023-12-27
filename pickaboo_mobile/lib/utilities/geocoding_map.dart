import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GeocodingMap {
  const GeocodingMap._();

  static Future<LatLng?> getCoordinatesFromAddress(String address) async {
    // print("ADDRESS $address");
    late LatLng coordinates;
    await locationFromAddress(address, localeIdentifier: "en").then((value) {
      if (value.isEmpty) {
        return null;
      }

      coordinates = LatLng(value[0].latitude, value[0].longitude);
    });
    return coordinates;
  }
}
