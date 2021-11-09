import 'package:flutter/material.dart';
import 'package:flutter_movie_app/app/constants/routes_constants.dart';
import 'package:flutter_movie_app/app/features/details/details_screen.dart';
import 'package:flutter_movie_app/app/features/home/home_screen.dart';

class RoutesGenerator{
  static Map<String, WidgetBuilder> getRoutes(RouteSettings setting) => {
    RoutesConstants.initial : (context) => HomeScreen(),
    RoutesConstants.home    : (context) => HomeScreen(),
    RoutesConstants.details : (context) => const DetailsScreen(),
   // movieDetailArguments: setting.arguments as MovieDetailArguments,
  };
}