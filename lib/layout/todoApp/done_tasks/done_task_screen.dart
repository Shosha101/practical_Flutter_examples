import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/components/component.dart';
import '../cubit/Cubit.dart';
import '../cubit/States.dart';

class done_tasks_screen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      builder: ( context,  state) {
        var tasks = AppCubit.get(context).Done_tasks_map;

          return tasksBuilder(tasks: tasks);
      },
      listener: ( context,  state) {  },



    );
  }

}