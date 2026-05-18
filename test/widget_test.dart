import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:SpaceXFlutterOdyssey/presentation/theme.dart';

void main() {
  // SpaceXColors — pure Dart constants, no Flutter binding needed
  group('SpaceXColors', () {
    test('primary orange color is correct', () {
      expect(SpaceXColors.orange, const Color(0xFFFF5722));
    });

    test('accent blueGray color is correct', () {
      expect(SpaceXColors.blueGray, const Color(0xFF607D8B));
    });

    test('dark theme background color is correct', () {
      expect(SpaceXColors.darkGray, const Color(0xFF212121));
    });
  });

  // CustomColorScheme — extension on ColorScheme, instantiated directly
  group('CustomColorScheme', () {
    test('success maps to SpaceXColors.green', () {
      const scheme = ColorScheme.light();
      expect(scheme.success, SpaceXColors.green);
    });

    test('info maps to SpaceXColors.blue', () {
      const scheme = ColorScheme.light();
      expect(scheme.info, SpaceXColors.blue);
    });

    test('warning maps to SpaceXColors.yellow', () {
      const scheme = ColorScheme.light();
      expect(scheme.warning, SpaceXColors.yellow);
    });

    test('danger maps to SpaceXColors.red', () {
      const scheme = ColorScheme.light();
      expect(scheme.danger, SpaceXColors.red);
    });
  });
}
