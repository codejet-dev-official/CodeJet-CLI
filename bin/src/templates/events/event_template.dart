String eventTemplate(String className){
 return '''
abstract class ${className}Event {}
  ''';
}