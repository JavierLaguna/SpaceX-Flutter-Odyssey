import 'package:SpaceXFlutterOdyssey/data/datasources/spacex_service/landpad_service.dart';
import 'package:SpaceXFlutterOdyssey/data/repositories/landpads/landpads_remote_repository_impl.dart';
import 'package:SpaceXFlutterOdyssey/domain/entities/launch.dart';
import 'package:get/get.dart';

class LaunchDetailViewModel extends GetxController {
  // -- Properties
  final Launch _launch;
  Rxn<Launch> launch = Rxn<Launch>();

  // -- Constructor
  LaunchDetailViewModel({required Launch launch}) : this._launch = launch {
    this.launch.value = launch;
  }

  // -- Lifecycle
  @override
  void onReady() {
    super.onReady();

    _getLandPad();
  }

  // -- Private methods
  _getLandPad() async {
    final repo = LandPadsRepositoryRemoteImpl(LandPadService());
    final landPads = await repo.getLandPad(_launch.launchpadId!);
    print(landPads);
  }
}
