import 'package:SpaceXFlutterOdyssey/domain/entities/landpad_status.dart';
import 'package:enum_to_string/enum_to_string.dart';

class LandPad {
  final String id;
  final LandPadStatus status;
  final int landingAttempts;
  final int landingSuccesses;

  // final List<String> launchesIds;
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
    // required this.launchesIds,
    this.name,
    this.fullName,
    this.type,
    this.locality,
    this.region,
    this.latitude,
    this.longitude,
    this.details,
  });

  factory LandPad.fromMap(Map<String, dynamic> map) {
    final status = EnumToString.fromString(LandPadStatus.values, map['status'],
        camelCase: true);

    return LandPad(
      id: map['id'],
      landingAttempts: map['landing_attempts'],
      landingSuccesses: map['landing_successes'],
      // launchesIds: map['launches'],
      status: status ?? LandPadStatus.unknown,
      details: map['details'],
      fullName: map['full_name'],
      latitude: map['latitude'],
      locality: map['locality'],
      longitude: map['longitude'],
      name: map['name'],
      region: map['region'],
      type: map['type'],
    );
  }
}
