import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tax_tds/Home/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((fn) => runApp(const MainApp()));
}
