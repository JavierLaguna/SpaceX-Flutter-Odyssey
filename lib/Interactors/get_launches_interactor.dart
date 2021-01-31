import 'package:SpaceXFlutterOdyssey/domain/entities/launches_list.dart';
import 'package:SpaceXFlutterOdyssey/domain/repository/launch_repository.dart';

class GetLaunchesInteractor {
  final LaunchRepository _launchRepository;

  GetLaunchesInteractor(this._launchRepository)
      : assert(_launchRepository != null);

  Future<LaunchesList> call() async {
    final launches = await _launchRepository.getAllLaunches();
    return launches;
  }
}
