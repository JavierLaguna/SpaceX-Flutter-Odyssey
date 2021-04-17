import 'package:SpaceXFlutterOdyssey/domain/entities/launchpad.dart';

abstract class LaunchpadsRepositoryRemote {
  Future<List<Launchpad>> getAllLaunchpads();

  Future<Launchpad> getLaunchpad(String launchpadId);
}
