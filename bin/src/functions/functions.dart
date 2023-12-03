import 'dart:io';

import '../templates/default_main_dart_template.dart';
import '../templates/default_pubspec_template.dart';

class Functions {
  

  // function will use for creating a new file
void generateFile(
    {required Directory directory,
    required String relativePath,
    required String content}) {
  final File file = File('${directory.path}/$relativePath');
  file.createSync(recursive: true);
  file.writeAsStringSync(content);
}

// function will use for creating a new folder
void generateFolder(
    {required Directory directory, required String relativePath}) {
  final Directory folder = Directory('${directory.path}/$relativePath');
  folder.createSync(recursive: true);
}


// function will use for customize main.dart file
void customizeMainDart(Directory directory, String? organizationName) {
  final File mainFile = File('${directory.path}/lib/main.dart');
  mainFile.writeAsStringSync(defaultMainDartTemplate(organizationName));
}


// function will use for modify pubspec.yaml file
void modifyPubspec(Directory directory, String projectName) {
  final File pubspecFile = File('${directory.path}/pubspec.yaml');

  // Add dependencies
  pubspecFile.writeAsStringSync(defaultPubspec(projectName));
}

Future<void> deleteTestFolder(String projectName) async {
  final Directory projectDirectory = Directory(projectName);
  final Directory testFolder = Directory('${projectDirectory.path}/test');

  if (testFolder.existsSync()) {
    await testFolder.delete(recursive: true);
    print('Test folder deleted.');
  } else {
    print('Test folder not found.');
  }
}


void appendToExistingFile({
  required Directory directory,
  required String relativePath,
  required String content,
}) {
  final File file = File('${directory.path}/$relativePath');
  if (!file.existsSync()) {
    file.createSync(recursive: true);
  }

  file.writeAsStringSync(content, mode: FileMode.append);
}


String convertToSnakeCase(String input) {
  // Add an underscore before each uppercase letter
  String snakeCase = input.replaceAllMapped(RegExp(r'[A-Z]'), (match) {
    return '_${match.group(0)!.toLowerCase()}';
  });

  // Remove the leading underscore if it exists
  if (snakeCase.startsWith('_')) {
    snakeCase = snakeCase.substring(1);
  }

  return snakeCase;
}
}