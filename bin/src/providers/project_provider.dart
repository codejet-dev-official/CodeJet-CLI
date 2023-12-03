import 'dart:io';

import 'package:process_run/process_run.dart';

import '../functions/functions.dart';
import '../templates/blocs/blocs_template.dart';
import '../templates/events/events_template.dart';
import '../templates/helpers/helpers_template.dart';
import '../templates/routes/routes_template.dart';
import '../templates/screens/screens.dart';
import '../templates/services/locator_service_template.dart';
import '../templates/themes/theme_template.dart';
import '../templates/widgets/widgets.dart';

class ProjectProvider {
  final _functions = Functions();
  Future<void> createFlutterProject(String? projectName,
      String? organizationName, bool? enableLocalization) async {
    if (projectName == null || projectName.isEmpty) {
      print('Please provide a valid project name.');
      return;
    }

    // Create the project directory
    final Directory projectDirectory = Directory(projectName);
    projectDirectory.createSync();

    // Generate custom project files
    _functions.generateFolder(
        directory: projectDirectory, relativePath: 'assets');
    _functions.generateFolder(
        directory: projectDirectory, relativePath: 'assets/images');
    _functions.generateFolder(
        directory: projectDirectory, relativePath: 'assets/anim');
    _functions.generateFile(
        directory: projectDirectory,
        relativePath: 'lib/main_bloc_observer.dart',
        content: defalutBlocObserverTemplate());
    _functions.generateFile(
        directory: projectDirectory,
        relativePath: 'lib/blocs/counter_bloc.dart',
        content: defaultCounterBlocTemplate());
    _functions.generateFile(
        directory: projectDirectory,
        relativePath: 'lib/events/counter_event.dart',
        content: defaultCounterEventTemplate());
    _functions.generateFile(
        directory: projectDirectory,
        relativePath: 'lib/screens/home_screen.dart',
        content: defaultHomeScreenTemplate());
    _functions.generateFile(
        directory: projectDirectory,
        relativePath: 'lib/screens/counter_screen.dart',
        content: defaultCounterScreenTemplate());
    _functions.generateFile(
        directory: projectDirectory,
        relativePath: 'lib/widgets/app_button.dart',
        content: defaultButtonWidgetTemplate());
    _functions.generateFile(
        directory: projectDirectory,
        relativePath: 'lib/services/locator_service.dart',
        content: locatorServiceTemplate());
    _functions.generateFile(
        directory: projectDirectory,
        relativePath: 'lib/routes/routes.dart',
        content: routesTemplate());
    _functions.generateFile(
        directory: projectDirectory,
        relativePath: 'lib/styles/app_theme.dart',
        content: themeTamplate());
    _functions.generateFile(
        directory: projectDirectory,
        relativePath: 'lib/helpers/asset_helper.dart',
        content: assetHelperTemplate());
    // Add more files as needed...

    // Run flutter create command
    final String flutterCreateCommand = 'flutter create $projectName';
    await run(flutterCreateCommand, verbose: true);

    // Customize the main.dart file
    _functions.customizeMainDart(projectDirectory, organizationName);

    // Modify pubspec.yaml
    _functions.modifyPubspec(projectDirectory, projectName);

    // Run flutter pub get
    await run('flutter pub get',
        workingDirectory: projectDirectory.path, verbose: true);

    // Delete the test folder
    await _functions.deleteTestFolder(projectName);

    print('Flutter project "$projectName" created successfully with CodeJet!');
  }
}
