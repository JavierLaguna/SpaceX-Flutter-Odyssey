import 'package:SpaceXFlutterOdyssey/presentation/scenes/settings/settings_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScene extends GetWidget<SettingsViewModel> {
  SettingsViewModel get _viewModel => super.controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('settings.title').tr(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'settings.darkModeLabel',
                        style: Theme.of(context).textTheme.subtitle1,
                      ).tr(),
                      SizedBox(width: 40),
                      Obx(() => Switch(
                          value: _viewModel.isDarkMode.value,
                          onChanged: _viewModel.setTheme)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
