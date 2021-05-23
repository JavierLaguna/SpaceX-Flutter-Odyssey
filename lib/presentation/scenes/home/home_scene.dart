import 'package:SpaceXFlutterOdyssey/presentation/scenes/home/home_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScene extends GetWidget<HomeViewModel> {
  HomeViewModel get _viewModel => super.controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('launches.title').tr(),
      ),
      body: SafeArea(bottom: false, child: Text("HOME")),
    );
  }
}
