import 'package:SpaceXFlutterOdyssey/domain/entities/launch.dart';
import 'package:get/get.dart';

class LaunchDetailViewModel extends GetxController {
  LaunchDetailViewModel({required Launch launch}) {
    this.launch.value = launch;
  }

  Rxn<Launch> launch = Rxn<Launch>();
}
