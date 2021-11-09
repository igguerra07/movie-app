import 'package:flutter/material.dart';
import 'package:flutter_movie_app/app/core/constants/routes_constants.dart';
import 'package:flutter_movie_app/app/core/routes/custom_route_builder.dart';
import 'package:flutter_movie_app/app/core/routes/routes_generator.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Movie Application",
      initialRoute: RoutesConstants.initial,
      onGenerateRoute: (RouteSettings settings) {
        final routes = RoutesGenerator.getRoutes(settings);
        final WidgetBuilder? builder = routes[settings.name];
        return CustomRouteBuilder(
          builder: builder,
          routeSettings: settings,
        );
      },
    );
  }
}
