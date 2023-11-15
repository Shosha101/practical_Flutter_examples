import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:ex1/layout/newsApp/cubit/news_cubit.dart';
import 'package:ex1/layout/newsApp/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/component.dart';

class BusinessScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return BlocConsumer<NewsCubit,NewStates>(

      builder: (BuildContext context, state) {
        var list=NewsCubit.get(context).listDataBusiness;
        return articleBuilder(list,context);
      },
      listener: (BuildContext context, Object? state) {  },



    );
  }
}