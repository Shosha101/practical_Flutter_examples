
import 'package:ex1/modules/counter/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CounterCubit extends Cubit<CounterStates>{
  CounterCubit():super(CounterInitialState());
  static CounterCubit get(context)=>BlocProvider.of(context);
  int count=0;
  void minus(){
    count--;
    emit(CounterMinusState(count));
  }
  void plus(){
    count++;
    emit(CounterPlusState(count));
  }
}
