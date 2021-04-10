import 'package:SpaceXFlutterOdyssey/domain/entities/landpad_status.dart';

class LandPad {
  final String id;
  final LandPadStatus status;
  final int landingAttempts;
  final int landingSuccesses;
  final List<String> launchesIds;
  final String? name;
  final String? fullName;
  final String? type;
  final String? locality;
  final String? region;
  final double? latitude;
  final double? longitude;
  final String? details;

  LandPad({
    required this.id,
    required this.status,
    required this.landingAttempts,
    required this.landingSuccesses,
    required this.launchesIds,
    this.name,
    this.fullName,
    this.type,
    this.locality,
    this.region,
    this.latitude,
    this.longitude,
    this.details,
  });
}
