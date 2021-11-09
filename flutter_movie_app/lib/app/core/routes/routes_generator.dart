import 'package:flutter/material.dart';
import 'package:flutter_movie_app/app/core/constants/routes_constants.dart';
import 'package:flutter_movie_app/app/pages/details/details_screen.dart';
import 'package:flutter_movie_app/app/pages/home/home_screen.dart';
import 'package:flutter_movie_app/app/pages/search/search_screen.dart';

class RoutesGenerator{
  static Map<String, WidgetBuilder> getRoutes(RouteSettings setting) => {
    RoutesConstants.initial : (context) => HomeScreen(),
    RoutesConstants.home    : (context) => HomeScreen(),
    RoutesConstants.search  : (context) => const SearchScreen(),
    RoutesConstants.details : (context) => const DetailsScreen(),
   // movieDetailArguments: setting.arguments as MovieDetailArguments,
  };
}