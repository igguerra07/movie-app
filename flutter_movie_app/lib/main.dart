import 'package:flutter/material.dart';
import 'package:flutter_movie_app/app/app_widget.dart';
import 'package:flutter_movie_app/app/core/di/get_it.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  runApp(const AppWidget());
}

