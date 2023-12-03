import '../../functions/functions.dart';

String blocTemplate(String className){
  final functions = Functions();
  return '''
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../events/${functions.convertToSnakeCase(className)}_event.dart';

class ${className}Bloc extends Bloc<${className}Event, dynamic> {
  ${className}Bloc() : super(null);

  Stream<dynamic> mapEventToState(${className}Event event) async* {
    // Write your bloc here...
  }
}
''';
}