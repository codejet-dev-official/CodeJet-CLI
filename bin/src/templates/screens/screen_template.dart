import '../../functions/functions.dart';

String screenTemplate(String className){
  final functions = Functions();
  return '''
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/${functions.convertToSnakeCase(className)}_bloc.dart';
import '../events/${functions.convertToSnakeCase(className)}_event.dart';

class ${className}Screen extends StatelessWidget {
  const ${className}Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ${className}Bloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('$className Screen'),
        ),
        body: BlocBuilder<${className}Bloc, dynamic>(
                builder: (context, state) {
                  return Text('Hello From Bloc');
                },
              ),
      ),
    );
  }
}

''';
}