import 'package:SpaceXFlutterOdyssey/domain/entities/launchesList.dart';
import 'package:SpaceXFlutterOdyssey/domain/spacex_service/launch_service.dart';

class GetLaunchesInteractor {
  final LaunchService _launchService;

  GetLaunchesInteractor(this._launchService) : assert(_launchService != null);

  Future<LaunchesList> call() async {
    var launches = await _launchService.getAllLaunches();
    return launches;
  }
}
