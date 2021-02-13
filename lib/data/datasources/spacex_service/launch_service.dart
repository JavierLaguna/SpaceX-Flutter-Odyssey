import 'package:SpaceXFlutterOdyssey/domain/entities/launches_list.dart'
    as launches_list;
import 'package:http/http.dart' as http;

class LaunchService {
  final String baseUrl = 'https://api.spacexdata.com/v4';

  Future<launches_list.LaunchesList> getAllLaunches() async {
    final url = '$baseUrl/launches';
    final response = await http.get(url);

    return launches_list.launchesListFromJson(response.body);
  }
}
