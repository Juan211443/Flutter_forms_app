part of 'counter_bloc.dart';

sealed class CounterState extends Equatable {
  final int counter;
  final int transactionCount;

  const CounterState({this.counter = 0, this.transactionCount = 0});

  CounterInitial copyWith({int? counter, int? transactionCount}) =>
      CounterInitial(
        counter: counter ?? this.counter,
        transactionCount: transactionCount ?? this.transactionCount,
      );

  @override
  List<Object> get props => [counter, transactionCount];
}

final class CounterInitial extends CounterState {
  const CounterInitial({super.counter, super.transactionCount});
}
