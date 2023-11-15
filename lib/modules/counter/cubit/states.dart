abstract class CounterStates{}
class CounterInitialState extends CounterStates{
}
class CounterPlusState extends CounterStates{
  final int count;
  CounterPlusState(this.count);

}
class CounterMinusState extends CounterStates{
  final int count;

  CounterMinusState(this.count);
}