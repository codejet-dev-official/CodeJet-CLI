import 'dart:io';

import '../functions/functions.dart';
import '../templates/blocs/blocs_template.dart';
import '../templates/events/events_template.dart';
import '../templates/screens/screen_template.dart';

class ScreenProvider {
  final _functions = Functions();

  Future<void> createScreen(String className) async {
  if (className.isEmpty) {
    print('Please provide a valid screen name.');
    return;
  }

  // Create screen file
  final Directory screensDirectory = Directory('lib/screens');
  _functions.generateFile(
      directory: screensDirectory,
      relativePath: '${_functions.convertToSnakeCase(className)}_screen.dart',
      content: screenTemplate(className)
  );

   // Create bloc file
  final Directory blocsDirectory = Directory('lib/blocs');
  _functions.generateFile(
      directory: blocsDirectory,
      relativePath: '${_functions.convertToSnakeCase(className)}_bloc.dart',
      content: blocTemplate(className)
  );

  // Create event file
  final Directory eventsDirectory = Directory('lib/events');
  _functions.generateFile(
      directory: eventsDirectory,
      relativePath: '${_functions.convertToSnakeCase(className)}_event.dart',
      content: eventTemplate(className)
  );

  // Create route entry
  final Directory routesDirectory = Directory('lib/routes');
  final routeContent = 'static const String ${_functions.convertToSnakeCase(className)} = \'/${_functions.convertToSnakeCase(className)}\';\n';
  _functions.appendToExistingFile(
      directory: routesDirectory,
      relativePath: 'routes.dart',
      content: routeContent
  );

  print('Screen "$className" created successfully!');
  }
}