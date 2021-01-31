import 'package:SpaceXFlutterOdyssey/domain/entities/launches_list.dart';

abstract class LaunchRepository {
  Future<LaunchesList> getAllLaunches();
}
