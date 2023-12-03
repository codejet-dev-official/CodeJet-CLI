import 'dart:io';
import 'package:args/args.dart';

import 'src/providers/bloc_provider.dart';
import 'src/providers/event_provider.dart';
import 'src/providers/project_provider.dart';
import 'src/providers/route_provider.dart';
import 'src/providers/screen_provider.dart';

void main(List<String> arguments) async {
  final projectProvider = ProjectProvider();
  final screenProvider = ScreenProvider();
  final blocProvider = BlocProvider();
  final eventProvider = EventProvider();
  final routeProvider = RouteProvider();
  final ArgParser argParser = ArgParser()
    ..addCommand('create', ArgParser()
      ..addCommand('project')
      ..addCommand('screen', ArgParser()
        ..addOption('name', help: 'Screen name')
      )
      ..addCommand('bloc')
      ..addCommand('event')
      ..addCommand('route')
    )
    ..addOption('name', help: 'Your project name')
    ..addOption('organization', help: 'Your organization name')
    ..addFlag('enable-localization', help: 'Enable localization', negatable: true)
    ..addFlag('version', abbr: 'v', negatable: false, help: 'Display CLI version');

    


  final ArgResults args = argParser.parse(arguments);
  const String cliVersion = '1.0.0';

  if (args['version'] == true) {
    print('CodeJet CLI Version: $cliVersion');
    return;
  }


  if (args.command != null && args.command!.name == 'create') {
    if (args.command!.arguments.isNotEmpty) {
      final subCommand = args.command!.arguments[0];
      if (subCommand == 'project') {
        final projectName = args['name'] as String? ?? prompt('Enter your project name:');
        final organizationName = args['organization'] as String? ?? prompt('Enter your organization name:');
        final enableLocalization = args['enable-localization'] as bool? ?? promptBool('Enable localization? (y/n):');

        await projectProvider.createFlutterProject(projectName, organizationName, enableLocalization);
      } else if (subCommand == 'screen') {
        final screenName = args.rest.isNotEmpty ? args.rest[0] : prompt('Enter screen name:');
        await screenProvider.createScreen(screenName);
      } else if(subCommand == 'bloc') {
        // create bloc
        final className = args.rest.isNotEmpty ? args.rest[0] : prompt('Enter bloc name:');
        await blocProvider.createBloc(className);
      } else if(subCommand == 'event') {
        // create event
        final className = args.rest.isNotEmpty ? args.rest[0] : prompt('Enter event name:');
        await eventProvider.createEvent(className);
      } else if(subCommand == 'route') {
        // create route
        final className = args.rest.isNotEmpty ? args.rest[0] : prompt('Enter route name:');
        await routeProvider.createRoute(className);
      } 
    } else {
      print(
          'Invalid command. Use "create project" or "create screen" to create a new Flutter project or screen.');
      print(argParser.usage);
    }
  } else {
    print(
        'Invalid command. Use "create project" or "create screen" to create a new Flutter project or screen.');
    print(argParser.usage);
  }



}


String prompt(String promptText) {
  stdout.write('$promptText ');
  return stdin.readLineSync()!;
}

bool promptBool(String promptText) {
  while (true) {
    stdout.write('$promptText ');
    final response = stdin.readLineSync()?.toLowerCase();
    if (response == 'y') {
      return true;
    } else if (response == 'n') {
      return false;
    } else {
      print('Invalid input. Please enter "y" or "n".');
    }
  }
}