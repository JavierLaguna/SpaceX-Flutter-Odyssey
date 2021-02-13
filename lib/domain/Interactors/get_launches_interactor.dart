import 'package:SpaceXFlutterOdyssey/domain/entities/launches_list.dart';
import 'package:SpaceXFlutterOdyssey/domain/repositories/launch/launch_remote_repository.dart';

abstract class GetLaunchesInteractor {
  Future<LaunchesList> get();
}

class GetLaunchesInteractorImpl extends GetLaunchesInteractor {
  final LaunchRepositoryRemote _launchRepositoryRemote;

  GetLaunchesInteractorImpl(this._launchRepositoryRemote)
      : assert(_launchRepositoryRemote != null);

  @override
  Future<LaunchesList> get() async {
    final launches = await _launchRepositoryRemote.getAllLaunches();
    return launches;
  }
}
