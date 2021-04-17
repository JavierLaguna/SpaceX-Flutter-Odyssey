import 'package:SpaceXFlutterOdyssey/domain/entities/landpad.dart';

abstract class LandPadsRepositoryRemote {
  Future<List<LandPad>> getAllLandPads();

  Future<LandPad> getLandPad(String landPadId);
}
