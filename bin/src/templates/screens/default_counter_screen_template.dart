String defaultCounterScreenTemplate() {
  return '''
// screens/counter_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/counter_bloc.dart';
import '../events/counter_event.dart';
import '../widgets/app_button.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Counter Screen'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<CounterBloc, int>(
                builder: (context, state) {
                  return Text('Counter: \$state');
                },
              ),
              const SizedBox(height: 20),
              AppButton(
                text: 'Increment Counter',
                onPressed: () {
                  context.read<CounterBloc>().add(IncrementCounterEvent());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

''';
}