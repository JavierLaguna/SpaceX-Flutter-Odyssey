import 'package:SpaceXFlutterOdyssey/domain/entities/launch.dart';
import 'package:SpaceXFlutterOdyssey/domain/repositories/launch/launch_remote_repository.dart';

abstract class GetLaunchesInteractor {
  Future<List<Launch>> get();
}

class GetLaunchesInteractorImpl extends GetLaunchesInteractor {
  final LaunchRepositoryRemote _launchRepositoryRemote;

  GetLaunchesInteractorImpl(this._launchRepositoryRemote)
      : assert(_launchRepositoryRemote != null);

  @override
  Future<List<Launch>> get() async {
    final launches = await _launchRepositoryRemote.getAllLaunches();
    return launches;
  }
}
