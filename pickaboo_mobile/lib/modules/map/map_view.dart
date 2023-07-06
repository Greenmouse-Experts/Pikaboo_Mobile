import 'package:flutter/material.dart';
import 'package:flutter_google_map_polyline_point/flutter_polyline_point.dart';
import 'package:flutter_google_map_polyline_point/point_lat_lng.dart';
import 'package:flutter_google_map_polyline_point/utils/polyline_result.dart';
//import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pickaboo_mobile/data/constants.dart';

import '../../widgets/widgets.dart';

class AppMapView extends StatefulWidget {
  const AppMapView({super.key});

  @override
  State<AppMapView> createState() => _AppMapViewState();
}

class _AppMapViewState extends State<AppMapView> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(6.62853279089364, 3.2892761108175783);
  final LatLng _destination =
      const LatLng(6.5982159133587555, 3.3539029113052066);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  List<LatLng> polylineCordiinates = [];

  void _getPolyPoints() async {
    print('object');
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        Constants.googleMapsApi,
        PointLatLng(
          _center.latitude,
          _center.longitude,
        ),
        PointLatLng(_destination.latitude, _destination.longitude));

    // dynamic result = await polylinePoints.getRouteBetweenCoordinates(
    //    ,
    //    _center.latitude, _center.longitude,
    //    _destination.latitude, _destination.longitude);
    print(result.errorMessage);
    print(result.status);

    // if (result.points.isNotEmpty) {
    //   for (PointLatLng element in result.points) {
    //     polylineCordiinates.add(LatLng(element.latitude, element.longitude));
    //   }
    //   print(polylineCordiinates);
    //   setState(() {});
    // }
  }

  @override
  void initState() {
    super.initState();
    _getPolyPoints();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar5(context, hasElevation: false),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: _center, zoom: 12.5),
        polylines: {
          Polyline(
              polylineId: const PolylineId('route'),
              points: polylineCordiinates)
        },
        markers: {
          Marker(markerId: const MarkerId('source'), position: _center),
          Marker(
              markerId: const MarkerId('destination'), position: _destination)
        },
      ),
    );
  }
}
