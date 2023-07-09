import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mapbox_polyline_points/mapbox_polyline_points.dart' as mb;

import '../../data/constants.dart';
import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class AppMapView extends StatefulWidget {
  const AppMapView({super.key});

  @override
  State<AppMapView> createState() => _AppMapViewState();
}

class _AppMapViewState extends State<AppMapView> {
  late GoogleMapController mapController;

  LocationData? currentLocation;
  final LatLng _center = const LatLng(6.62853279089364, 3.2892761108175783);
  final LatLng _destination =
      const LatLng(6.5982159133587555, 3.3539029113052066);
  Map<PolylineId, Polyline> polylines = {};

  @override
  void initState() {
    _getCurrentLocation();
    super.initState();
    _getPolyPoints();
  }

  void _getCurrentLocation() {
    Location location = Location();

    location.getLocation().then((value) {
      setState(() {
        currentLocation = value;
      });
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  List<List<LatLng>> polylineCordinates = [];

  _addPolyLine() {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id,
        width: 5,
        color: AppColors.primary,
        points: polylineCordinates[0]);
    polylines[id] = polyline;
    setState(() {});
  }

  void _getPolyPoints() async {
    mb.MapboxpolylinePoints mapboxpolylinePoints = mb.MapboxpolylinePoints();

    mb.MapboxPolylineResult result =
        await mapboxpolylinePoints.getRouteBetweenCoordinates(
            Constants.mapBoxKey,
            mb.PointLatLng(
                latitude: _center.latitude, longitude: _center.longitude),
            mb.PointLatLng(
                latitude: _destination.latitude,
                longitude: _destination.longitude),
            mb.TravelType.driving);

    if (result.points.isNotEmpty) {
      for (var element in result.points) {
        polylineCordinates.add(decodeEncodedPolyline(element));
      }
      _addPolyLine();
    }
  }

  List<LatLng> decodeEncodedPolyline(List<mb.PointLatLng> encoded) {
    List<LatLng> poly = [];
    for (int i = 0; i < encoded.length; i++) {
      poly.add(LatLng(encoded[i].latitude, encoded[i].longitude));
    }
    return poly;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar5(context, hasElevation: false),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: _center, zoom: 12.5),
        polylines: Set<Polyline>.of(polylines.values),
        markers: {
          Marker(
            markerId: const MarkerId('source'),
            position: _center,
          ),
          Marker(
              markerId: const MarkerId('destination'), position: _destination)
        },
      ),
    );
  }
}
