import 'package:SpaceXFlutterOdyssey/data/models/launchesList.dart';
import 'package:SpaceXFlutterOdyssey/data/spacex_service/launch_service.dart';

import 'launchRepository.dart';

class LaunchRepositoryImpl extends LaunchRepository {
  final LaunchService _launchService;

  LaunchRepositoryImpl(this._launchService) : assert(_launchService != null);

  @override
  Future<LaunchesList> getAllLaunches() async {
    var launches = await _launchService.getAllLaunches();
    return launches;
  }
}
