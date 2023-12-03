String defaultHomeScreenTemplate() {
  return '''
// screens/home_screen.dart

import 'package:flutter/material.dart';
import '../widgets/app_button.dart';
import '../routes/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: AppButton(
          text: 'Go to Counter Page',
          onPressed: () {
            Navigator.pushNamed(context, Routes.counter);
          },
        ),
      ),
    );
  }
}

  ''';
}