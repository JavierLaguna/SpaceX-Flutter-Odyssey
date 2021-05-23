import 'package:SpaceXFlutterOdyssey/domain/entities/launch.dart';

abstract class LaunchRepositoryRemote {
  Future<List<Launch>> getAllLaunches();
  Future<List<Launch>> getUpcomingLaunches();
}
