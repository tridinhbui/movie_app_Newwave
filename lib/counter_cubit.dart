import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState());

  void increment() {
    CounterState inc = CounterState(i: state.i +=2);
    emit(inc);
  }
// void decrement() => emit(state - 1);
}
