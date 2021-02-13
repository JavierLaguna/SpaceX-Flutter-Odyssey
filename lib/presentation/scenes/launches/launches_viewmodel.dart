import 'package:SpaceXFlutterOdyssey/domain/Interactors/get_launches_interactor.dart';
import 'package:SpaceXFlutterOdyssey/domain/entities/launch.dart';
import 'package:get/get.dart';

class LaunchesViewModel extends GetxController {
  final GetLaunchesInteractor _getLaunchesInteractor;

  LaunchesViewModel(this._getLaunchesInteractor);

  RxList<Launch> launches = <Launch>[].obs;

  @override
  void onReady() {
    super.onReady();

    _getLaunches();
  }

  _getLaunches() async {
    final launches = await _getLaunchesInteractor.get();
    this.launches.assignAll(launches.launches);
  }
}
