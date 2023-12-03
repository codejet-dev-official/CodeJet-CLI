String locatorServiceTemplate() {
  return '''
// locator.dart

import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  // Add your services or dependencies here
}

''';
}