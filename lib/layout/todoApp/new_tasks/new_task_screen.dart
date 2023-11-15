import 'package:ex1/shared/components/component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/Cubit.dart';
import '../cubit/States.dart';


class new_tasks_screen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit,AppStates>(
      builder: ( context,  state) {
        var tasks = AppCubit.get(context).New_tasks_map;

        return tasksBuilder(tasks: tasks);
      },
      listener: ( context,  state) {  },



    );
  }
}