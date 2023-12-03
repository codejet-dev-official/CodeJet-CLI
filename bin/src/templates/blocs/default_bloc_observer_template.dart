String defalutBlocObserverTemplate() {
  return '''
// main_bloc_observer.dart

import 'package:bloc/bloc.dart';

class MainBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);

  }
}

''';
}
