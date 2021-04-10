import 'dart:convert';
import 'package:SpaceXFlutterOdyssey/domain/entities/launchpad.dart';
import 'package:SpaceXFlutterOdyssey/domain/entities/launchpad_status.dart';
import 'package:enum_to_string/enum_to_string.dart';

LaunchpadServiceResponse makeFromResponse(String str) =>
    LaunchpadServiceResponse.fromMap(json.decode(str));

class LaunchpadServiceResponse extends Launchpad {
  LaunchpadServiceResponse({
    required String id,
    required LaunchpadStatus status,
    required int launchAttempts,
    required int launchSuccesses,
    required List<String> launchesIds,
    required List<String> rocketsIds,
    String? name,
    String? fullName,
    String? type,
    String? locality,
    String? region,
    double? latitude,
    double? longitude,
    String? timezone,
  }) : super(
            status: status,
            launchesIds: launchesIds,
            rocketsIds: rocketsIds,
            launchSuccesses: launchSuccesses,
            launchAttempts: launchSuccesses,
            name: name,
            id: id,
            region: region,
            longitude: longitude,
            latitude: latitude,
            locality: locality,
            fullName: fullName,
            timezone: timezone);

  factory LaunchpadServiceResponse.fromMap(Map<String, dynamic> map) {
    final launchesIds = new List<String>.from(map['launches']);
    final rocketsIds = new List<String>.from(map['rockets']);

    final status = EnumToString.fromString(
        LaunchpadStatus.values, map['status'],
        camelCase: true);

    return LaunchpadServiceResponse(
      id: map['id'],
      launchAttempts: map['launch_attempts'],
      launchSuccesses: map['launch_successes'],
      launchesIds: launchesIds,
      rocketsIds: rocketsIds,
      status: status ?? LaunchpadStatus.unknown,
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
