import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../widgets/widgets.dart';

class AppMapView extends StatefulWidget {
  const AppMapView({super.key});

  @override
  State<AppMapView> createState() => _AppMapViewState();
}

class _AppMapViewState extends State<AppMapView> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(6.5438101, 5.8987138999999615);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar5(context, hasElevation: false),
      body: GoogleMap(
          initialCameraPosition: CameraPosition(target: _center, zoom: 11.0)),
    );
  }
}
