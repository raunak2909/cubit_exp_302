import 'package:cubit_exp_302/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState>{
  ///initial state
  CounterCubit() : super(CounterState(count: 0)); ///initial state

  ///events
  void incrementCount(){
    emit(CounterState(count: state.count+1));
  }

  void decrementCount(){
    if(state.count>0) {
      emit(CounterState(count: state.count-1));
    }
  }

}