import 'package:SpaceXFlutterOdyssey/data/datasources/spacex_service/landpad_service.dart';
import 'package:SpaceXFlutterOdyssey/data/repositories/landpads/landpads_remote_repository_impl.dart';
import 'package:SpaceXFlutterOdyssey/domain/entities/launch.dart';
import 'package:get/get.dart';

class LaunchDetailViewModel extends GetxController {
  // -- Properties
  Rxn<Launch> launch = Rxn<Launch>();

  // -- Constructor
  LaunchDetailViewModel({required Launch launch}) {
    this.launch.value = launch;
  }

  // -- Lifecycle
  @override
  void onReady() {
    super.onReady();

    _getLandPads();
  }

  // -- Private methods
  _getLandPads() async {
    final repo = LandPadsRepositoryRemoteImpl(LandPadService());
    final landPads = await repo.getAllLandPads();
    print(landPads);
  }
}
