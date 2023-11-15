import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class counter_screen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return CounterCubit();
      },
      child: BlocConsumer<CounterCubit,CounterStates>(
        listener: (context,state){
          if(state is CounterInitialState) {
            print('initial state');
          }
          if(state is CounterMinusState) {
            print('Minus state${state.count}');
          }
          if(state is CounterPlusState) {
            print('Plus state${state.count}');
          }
        },
        builder: (context,state){
          return Scaffold(
          appBar: AppBar(
          title:Text(
          "COUNTER"
          )
          ),
          body: Center(
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          TextButton(
          onPressed: () {
          CounterCubit.get(context).plus();
          }, child: Text('max',style:TextStyle(fontSize: 30))),
          Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text("${CounterCubit.get(context).count}",style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 50
          )
          ),
          ),
          TextButton(onPressed: () {
          if(CounterCubit.get(context).count>0){
            CounterCubit.get(context).minus();
          }
          else
          print("no enough money");

          }, child: Text("min",style:TextStyle(fontSize: 30),))
          ],
          ),
          ),

          );
        },

      ),
    );
  }
  }



