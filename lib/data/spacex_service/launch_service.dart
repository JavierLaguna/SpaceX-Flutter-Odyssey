import 'dart:convert';

import 'package:SpaceXFlutterOdyssey/data/models/launchesList.dart';
import 'package:http/http.dart' as http;

class LaunchService {
  final String baseUrl = 'https://api.spacexdata.com/v4';

  Future<LaunchesList> getAllLaunches() async {
    var url = '$baseUrl/launches';
    var response = await http.get(url);

    print('Response body: ${response.body}');

    // TODO: MODE DECODE
    var launches = LaunchesList.fromJson(json.decode(response.body));

    return LaunchesList(launches: null);
  }
}
