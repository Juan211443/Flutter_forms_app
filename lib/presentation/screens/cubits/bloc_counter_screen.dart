import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/providers/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: const BlocCounterView(),
    );
  }
}

class BlocCounterView extends StatelessWidget {
  const BlocCounterView({super.key});

  void _increaseCounterBy(BuildContext context, [int value = 1]) {
    // context.read<CounterBloc>().add(CounterIncreased(value));
    context.read<CounterBloc>().increaseBy(value);
  }

  @override
  Widget build(BuildContext context) {
    final counters = context.select<CounterBloc, CounterState>(
      (bloc) => bloc.state,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc counter: ${counters.transactionCount}'),
        actions: [
          IconButton(
            // onPressed: () => context.read<CounterBloc>().add(CounterReset()),
            onPressed: () => context.read<CounterBloc>().onReset(),
            icon: Icon(Icons.refresh_outlined),
          ),
        ],
      ),
      body: Center(child: Text('Counter value: ${counters.counter}')),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => _increaseCounterBy(context, 3),
            heroTag: '1',
            child: const Text('+3'),
          ),
          SizedBox(height: 15),
          FloatingActionButton(
            onPressed: () => _increaseCounterBy(context, 2),
            heroTag: '2',
            child: const Text('+2'),
          ),
          SizedBox(height: 15),
          FloatingActionButton(
            onPressed: () => _increaseCounterBy(context),
            heroTag: '3',
            child: const Text('+1'),
          ),
        ],
      ),
    );
  }
}
