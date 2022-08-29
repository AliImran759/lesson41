part of 'counter_bloc.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}

class CounterLoading extends CounterState {}

class CounterError extends CounterState {}

class CounterNum extends CounterState {
  final int amount;

  CounterNum({required this.amount});
} 


