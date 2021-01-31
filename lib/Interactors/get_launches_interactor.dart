import 'package:SpaceXFlutterOdyssey/domain/entities/launchesList.dart';
import 'package:SpaceXFlutterOdyssey/domain/repository/launchRepository.dart';

class GetLaunchesInteractor {
  final LaunchRepository _launchRepository;

  GetLaunchesInteractor(this._launchRepository)
      : assert(_launchRepository != null);

  Future<LaunchesList> call() async {
    var launches = await _launchRepository.getAllLaunches();
    return launches;
  }
}
