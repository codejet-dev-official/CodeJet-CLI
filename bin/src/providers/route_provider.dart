import 'dart:io';

import '../functions/functions.dart';

class RouteProvider {
  final _functions = Functions();
  Future<void> createRoute(String className) async {
    final Directory routesDirectory = Directory('lib/routes');
  final routeContent = 'static const String ${_functions.convertToSnakeCase(className)} = \'/${_functions.convertToSnakeCase(className)}\';\n';
  _functions.appendToExistingFile(
      directory: routesDirectory,
      relativePath: 'routes.dart',
      content: routeContent
  );

  print('Route "$className" created successfully!');
  }
}