import 'package:flutter/material.dart';

enum Flavor { dev, qa, production }

class FlavorConfig {
  final Flavor flavor;
  final String name;
  final Color color;
  static FlavorConfig? _instance;

  factory FlavorConfig({
    required Flavor flavor,
    Color color = Colors.blue,
  }) {
    _instance ??= FlavorConfig._internal(
      flavor,
      StringUtils.enumName(flavor.toString()),
      color,
    );
    return _instance!;
  }

  FlavorConfig._internal(
    this.flavor,
    this.name,
    this.color,
  );

  static FlavorConfig? get instance {
    return _instance;
  }

  static bool isProduction() => _instance?.flavor == Flavor.production;

  static bool isDevelopment() => _instance?.flavor == Flavor.dev;

  static bool isQA() => _instance?.flavor == Flavor.qa;
}

class StringUtils {
  static String enumName(String enumToString) {
    List<String> paths = enumToString.split(".");
    return paths[paths.length - 1];
  }
}
