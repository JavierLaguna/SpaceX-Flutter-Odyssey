import 'package:SpaceXFlutterOdyssey/domain/entities/launchpad.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LaunchpadMap extends StatelessWidget {
  late Launchpad _launchpad;
  late Set<Marker> _markers;
  late CameraPosition _cameraPosition;

  LaunchpadMap({required Launchpad launchpad}) : super() {
    this._launchpad = launchpad;
    this._markers = Set.from([
      Marker(
          markerId: MarkerId(launchpad.name!),
          position: LatLng(launchpad.latitude!, launchpad.longitude!),
          infoWindow:
              InfoWindow(title: 'New York', snippet: 'Welcome to New York'))
    ]);
    this._cameraPosition = CameraPosition(
      target: LatLng(launchpad.latitude!, launchpad.longitude!),
      zoom: 12.000,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _markers.isEmpty
        ? Text("EMPTY")
        : GoogleMap(
            markers: _markers,
            mapType: MapType.normal,
            initialCameraPosition: _cameraPosition,
          );
  }
}
