import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/providers/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const _CubitCounterView(),
    );
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  @override
  Widget build(BuildContext context) {
    // final counterState = context.watch<CounterCubit>().state;
    final counterCubit = context.read<CounterCubit>();

    return Scaffold(
      appBar: AppBar(
        // title: Text('Cubit counter: ${counterState.transactionCount}'),
        actions: [
          IconButton(
            onPressed: () {
              counterCubit.reset();
            },
            icon: Icon(Icons.refresh_outlined),
          ),
        ],
      ),
      body: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          return Center(child: Text('Counter value: ${state.counter}'));
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            onPressed: () {
              counterCubit.increaseBy(3);
            },
            child: const Text('+3'),
          ),
          SizedBox(height: 15),
          FloatingActionButton(
            heroTag: '2',
            onPressed: () {
              counterCubit.increaseBy(2);
            },
            child: const Text('+2'),
          ),
          SizedBox(height: 15),
          FloatingActionButton(
            heroTag: '3',
            onPressed: () {
              counterCubit.increaseBy(1);
            },
            child: const Text('+1'),
          ),
        ],
      ),
    );
  }
}
