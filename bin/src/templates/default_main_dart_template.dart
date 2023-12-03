
String defaultMainDartTemplate(String? organizationName) {
  final String organizationStatement =
      organizationName != null && organizationName.isNotEmpty
          ? '  // Organization: $organizationName\n'
          : '';

  return '''
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'routes/routes.dart';
import 'screens/counter_screen.dart';
import 'screens/home_screen.dart';
import 'main_bloc_observer.dart';
import 'services/locator_service.dart';
import 'styles/app_theme.dart';

void main() {
$organizationStatement
  Bloc.observer = MainBlocObserver();
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (context, _) {
        return MaterialApp(
      title: 'CodeJet App',
      theme: appTheme,
      initialRoute: Routes.home,
      routes: {
        Routes.home: (context) => const HomeScreen(),
        Routes.counter: (context) => const CounterScreen(),
      },
    );
      },
    );
    
  }
}
  ''';
}