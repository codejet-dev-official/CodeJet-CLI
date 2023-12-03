String defaultPubspec(String projectName){
  return '''
name: $projectName
description: A new Flutter project created with CodeJet CLI
version: 1.0.0+1
publish_to: 'none'

environment:
  sdk: '>=3.2.2 <4.0.0'

# Add regular dependencies here.
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2
  flutter_bloc: ^8.1.3
  bloc: ^8.1.2
  get_it: ^7.6.4
  flutter_screenutil: ^5.9.0

dev_dependencies:
  flutter_lints: ^2.0.0
  
flutter:
  uses-material-design: true
  assets:
    - assets/images/
    - assets/anim/
''';
}