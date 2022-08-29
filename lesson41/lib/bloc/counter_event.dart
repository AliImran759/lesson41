part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class IncrementCounterEvent extends CounterEvent {
  final int counter;

  IncrementCounterEvent({required this.counter});
}

class UnIncrementCounterEvent extends CounterEvent {
  final int counter;

  UnIncrementCounterEvent({required this.counter});
}
