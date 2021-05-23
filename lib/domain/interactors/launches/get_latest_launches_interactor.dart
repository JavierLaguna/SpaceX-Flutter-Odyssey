import 'package:SpaceXFlutterOdyssey/domain/entities/launch.dart';
import 'package:SpaceXFlutterOdyssey/domain/repositories/launch/launch_remote_repository.dart';

abstract class GetLatestLaunchesInteractor {
  Future<List<Launch>> get();
}

class GetLatestLaunchesInteractorImpl extends GetLatestLaunchesInteractor {
  final LaunchRepositoryRemote _launchRepositoryRemote;

  GetLatestLaunchesInteractorImpl(this._launchRepositoryRemote);

  @override
  Future<List<Launch>> get() async {
    final launches = await _launchRepositoryRemote.getLatestLaunches();
    return launches;
  }
}
