import 'package:flutter/material.dart';
import 'package:notes_app/launcher/app.dart';
import 'package:shared/shared.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FlavorConfig(flavor: Flavor.qa,
    color: Colors.deepPurpleAccent,
  );
  runApp(const App());
}