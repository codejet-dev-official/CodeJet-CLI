import 'dart:io';

import '../functions/functions.dart';
import '../templates/events/events_template.dart';

class EventProvider {
  final _functions = Functions();
  Future<void> createEvent(String className) async {
    // Create event file
  final Directory eventsDirectory = Directory('lib/events');
  _functions.generateFile(
      directory: eventsDirectory,
      relativePath: '${_functions.convertToSnakeCase(className)}_event.dart',
      content: eventTemplate(className)
  );

  print('Event "$className" created successfully!');
  }
}