import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/newsApp/cubit/news_cubit.dart';
import '../../layout/newsApp/cubit/states.dart';
import '../../shared/components/component.dart';

class ScienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewStates>(

      builder: (BuildContext context, state) {
        var list=NewsCubit.get(context).listDataScience;
        return articleBuilder(list,context);
      },
      listener: (BuildContext context, Object? state) {  },



    );
  }
}