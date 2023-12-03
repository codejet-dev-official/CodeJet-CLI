String defaultCounterBlocTemplate() {
  return '''
// blocs/counter_bloc.dart

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../events/counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0);

  Stream<int> mapEventToState(CounterEvent event) async* {
    if (event is IncrementCounterEvent) {
      yield state + 1;
    }
  }
}

  ''';
}
