String defaultCounterEventTemplate() {
  return '''
// events/counter_event.dart

abstract class CounterEvent {}

class IncrementCounterEvent extends CounterEvent {}
  ''';
}