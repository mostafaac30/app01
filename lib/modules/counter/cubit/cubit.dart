import 'package:app01/modules/counter/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(CounterInitialState());
  int counter = 0;
  static CounterCubit getCubitOjb(context) => BlocProvider.of(context);

  void add() {
    counter++;
    emit(CounterAddState());
  }

  void remove() {
    counter--;
    emit(CounterRemoveState());
  }
}
