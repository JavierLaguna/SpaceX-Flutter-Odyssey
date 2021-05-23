import 'package:SpaceXFlutterOdyssey/domain/entities/launch.dart';
import 'package:SpaceXFlutterOdyssey/domain/repositories/launch/launch_remote_repository.dart';

abstract class GetUpcomingLaunchesInteractor {
  Future<List<Launch>> get();
}

class GetUpcomingLaunchesInteractorImpl extends GetUpcomingLaunchesInteractor {
  final LaunchRepositoryRemote _launchRepositoryRemote;

  GetUpcomingLaunchesInteractorImpl(this._launchRepositoryRemote);

  @override
  Future<List<Launch>> get() async {
    final launches = await _launchRepositoryRemote.getUpcomingLaunches();
    return launches;
  }
}
