import 'package:SpaceXFlutterOdyssey/domain/entities/launch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LaunchDetailViewModel extends GetxController {
  LaunchDetailViewModel({@required launch}) {
    this.launch.value = launch;
  }

  Rx<Launch> launch = Launch(
          flightNumber: null,
          name: null,
          id: null,
          upcoming: null,
          launchDateUnix: null,
          launchDateUTC: null,
          launchDateLocal: null,
          success: null,
          patchImageSmall: null,
          patchImageLarge: null,
          youtubeId: null,
          details: null)
      .obs;
}
