import 'package:SpaceXFlutterOdyssey/domain/entities/launchpad_status.dart';

class Launchpad {
  final String id;
  final LaunchpadStatus status;
  final int launchAttempts;
  final int launchSuccesses;
  final List<String> launchesIds;
  final List<String> rocketsIds;
  final String? name;
  final String? fullName;
  final String? locality;
  final String? region;
  final double? latitude;
  final double? longitude;
  final String? timezone;

  Launchpad({
    required this.id,
    required this.status,
    required this.launchAttempts,
    required this.launchSuccesses,
    required this.launchesIds,
    required this.rocketsIds,
    this.name,
    this.fullName,
    this.locality,
    this.region,
    this.latitude,
    this.longitude,
    this.timezone,
  });
}
