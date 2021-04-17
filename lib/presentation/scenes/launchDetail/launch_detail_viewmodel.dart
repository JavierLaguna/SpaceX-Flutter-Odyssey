import 'package:SpaceXFlutterOdyssey/domain/entities/launch.dart';
import 'package:SpaceXFlutterOdyssey/domain/entities/launchpad.dart';
import 'package:SpaceXFlutterOdyssey/domain/interactors/launchpads/get_launchpad_interactor.dart';
import 'package:get/get.dart';

class LaunchDetailViewModel extends GetxController {
  // -- Properties
  final Launch _launch;
  final GetLaunchpadInteractor _getLaunchpadInteractor;
  Rxn<Launch> launch = Rxn<Launch>();
  Rxn<Launchpad> launchpad = Rxn<Launchpad>();

  // -- Constructor
  LaunchDetailViewModel(
      {required Launch launch,
      required GetLaunchpadInteractor getLaunchpadInteractor})
      : this._launch = launch,
        this._getLaunchpadInteractor = getLaunchpadInteractor {
    this.launch.value = launch;
  }

  // -- Lifecycle
  @override
  void onReady() {
    super.onReady();

    _getLaunchpad();
  }

  // -- Private methods
  _getLaunchpad() async {
    if (_launch.launchpadId != null) {
      final launchpad = await _getLaunchpadInteractor.get(_launch.launchpadId!);
      this.launchpad.value = launchpad;
    }
  }
}
