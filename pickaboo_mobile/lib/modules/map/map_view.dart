import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mapbox_polyline_points/mapbox_polyline_points.dart' as mb;
// import 'package:pickaboo_mobile/controllers/driver_requests/driver_request_controller.dart';
// import 'package:pickaboo_mobile/data/models/driver_schedule_residence_schema.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/constants.dart';
import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class AppMapView extends ConsumerStatefulWidget {
  final String latitude;
  final String longitude;

  const AppMapView({
    super.key,
    required this.latitude,
    required this.longitude,
  });

  @override
  ConsumerState<AppMapView> createState() => _AppMapViewConsumerState();
}

class _AppMapViewConsumerState extends ConsumerState<AppMapView> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(6.62853279089364, 3.2892761108175783);
  final LatLng _destination =
      const LatLng(6.5982159133587555, 3.3539029113052066);
  Map<PolylineId, Polyline> polylines = {};

  @override
  void initState() {
    super.initState();
    _getPolyPoints();
  }

  void openMap() async {
    var latitude = double.tryParse(widget.latitude) ?? _destination.latitude;
    double longitude =
        double.tryParse(widget.longitude) ?? _destination.longitude;
    final url = Platform.isIOS
        ? 'https://maps.apple.com/?q=$latitude,$longitude'
        : 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
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
        latitude: _center.latitude,
        longitude: _center.longitude,
      ),
      mb.PointLatLng(
        latitude: _destination.latitude,
        longitude: _destination.longitude,
      ),
      mb.TravelType.driving,
    );

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
  Widget build(BuildContext context,) {
    // final driver = ref.watch(driverRequestProvider).;
    // final requestDetails =
    //     DriverScheduleResidenceSchema.fromRawRouterJson(request);
    
    return Scaffold(
      appBar: customAppBar5(context, hasElevation: false),
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition:
                CameraPosition(target: _destination, zoom: 12.5),
            markers: {
              Marker(
                markerId: const MarkerId('destination'),
                position: _destination,
              )
            },
            polylines: Set<Polyline>.of(polylines.values),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: AppButton(
              text: "Open in Maps",
              onPressed: () {
                openMap();
              },
            ),
          )
        ],
      ),
    );
  }
}
