import 'package:SpaceXFlutterOdyssey/domain/entities/launchpad.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LaunchpadMap extends StatelessWidget {
  static const _mapZoom = 12.000;

  final Launchpad _launchpad;

  Set<Marker>? _markers;
  CameraPosition? _cameraPosition;

  LaunchpadMap({required Launchpad launchpad}) : _launchpad = launchpad {
    if (launchpad.latitude != null && launchpad.longitude != null) {
      _markers = {
        Marker(
            markerId: MarkerId(launchpad.id),
            position: LatLng(launchpad.latitude!, launchpad.longitude!),
            infoWindow:
                InfoWindow(title: launchpad.name, snippet: launchpad.fullName))
      };

      _cameraPosition = CameraPosition(
        target: LatLng(launchpad.latitude!, launchpad.longitude!),
        zoom: _mapZoom,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _cameraPosition == null || _markers == null || _markers!.isEmpty
        ? _EmptyLocation()
        : Column(
            children: [
              _DetailSection(
                launchpad: _launchpad,
              ),
              Expanded(
                child: GoogleMap(
                  markers: _markers!,
                  mapType: MapType.normal,
                  initialCameraPosition: _cameraPosition!,
                ),
              ),
            ],
          );
  }
}

class _EmptyLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.location_off,
          size: 80,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(
            'launchpadMap.noLocationData',
            style: theme.textTheme.titleLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ).tr(),
        ),
      ],
    );
  }
}

class _DetailSection extends StatelessWidget {
  final Launchpad _launchpad;

  const _DetailSection({required Launchpad launchpad})
      : _launchpad = launchpad;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          if (_launchpad.name != null)
            Text(
              _launchpad.name!,
              style: theme.textTheme.titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          SizedBox(
            height: 20,
          ),
          if (_launchpad.locality != null && _launchpad.region != null)
            Row(
              children: [
                Icon(Icons.location_city),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text('${_launchpad.locality!}, ${_launchpad.region!}'),
                ),
              ],
            ),
          Row(
            children: [
              Icon(Icons.bar_chart),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Text(_launchpad.status.toString()),
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.autorenew),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Text(
                    "${tr('launchpadMap.attempts')}: ${_launchpad.launchAttempts.toString()}"),
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.check_circle),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Text(
                    "${tr('launchpadMap.successes')}: ${_launchpad.launchSuccesses.toString()}"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
