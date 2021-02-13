import 'package:SpaceXFlutterOdyssey/domain/entities/launches_list.dart';
import 'package:SpaceXFlutterOdyssey/domain/repositories/launch/launch_remote_repository.dart';

abstract class GetLaunchesInteractor {}

class GetLaunchesInteractorImpl extends GetLaunchesInteractor {
  final LaunchRepositoryRemote _launchRepositoryRemote;

  GetLaunchesInteractorImpl(this._launchRepositoryRemote)
      : assert(_launchRepositoryRemote != null);

  Future<LaunchesList> call() async {
    final launches = await _launchRepositoryRemote.getAllLaunches();
    return launches;
  }
}
