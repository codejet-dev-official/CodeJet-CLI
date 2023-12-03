import 'dart:io';

import '../functions/functions.dart';
import '../templates/blocs/blocs_template.dart';

class BlocProvider {
  final _functions = Functions();
  Future<void> createBloc(String className) async {
     // Create bloc file
  final Directory blocsDirectory = Directory('lib/blocs');
  _functions.generateFile(
      directory: blocsDirectory,
      relativePath: '${_functions.convertToSnakeCase(className)}_bloc.dart',
      content: blocTemplate(className)
  );

  print('Bloc "$className" created successfully!');
  }
}