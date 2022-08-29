import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    // on<CounterEvent>((event, emit) {
    //   if (event is IncrementCounterEvent) {
    //     int count = event.counter + 1;
    //     emit(CounterNum(amount: count));
    //   }
    // });
    on<IncrementCounterEvent>((event, emit) async {
      try {
        emit(CounterLoading());
        await Future.delayed(const Duration(seconds: 1));
        int count = event.counter + 1;
        emit(CounterNum(amount: count));
      } catch (_) {
        emit(CounterError());
      }
    });
    on<UnIncrementCounterEvent>((event, emit) async {
      try {
        emit(CounterLoading());
        int count = event.counter - 1;
        if (count >= 0) {
          await Future.delayed(const Duration(seconds: 1));
          emit(CounterNum(amount: count));
        } else{
          await Future.delayed(const Duration(seconds: 1), () => throw Exception());
        }
      } catch (_) {
        emit(CounterError());
      }
    });
  }
}
