import 'package:flutter/material.dart';
import 'package:notes_app/launcher/app.dart';
import 'package:shared/shared.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FlavorConfig(flavor: Flavor.dev,
    color: Colors.green,
  );
  runApp(const App());
}