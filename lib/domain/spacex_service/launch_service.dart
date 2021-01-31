import 'package:SpaceXFlutterOdyssey/domain/entities/launchesList.dart'
    as LaunchesList;
import 'package:http/http.dart' as http;

class LaunchService {
  final String baseUrl = 'https://api.spacexdata.com/v4';

  Future<LaunchesList.LaunchesList> getAllLaunches() async {
    var url = '$baseUrl/launches';
    var response = await http.get(url);

    return LaunchesList.launchesListFromJson(response.body);
  }
}
