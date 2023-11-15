import 'package:ex1/layout/newsApp/cubit/news_cubit.dart';
import 'package:ex1/layout/newsApp/cubit/states.dart';
import 'package:ex1/layout/todoApp/cubit/Cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/search/search_screen.dart';
import '../../shared/components/component.dart';

class news_layout extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewStates>(
      builder: (BuildContext context, NewStates state) {
        var cubit=NewsCubit.get(context);
        return Scaffold(
        appBar: AppBar(
          title:const Text("News"),
          actions: [
            IconButton(
                onPressed: (){
                  navigateTo(context,Search_Screen());
                  },
                icon: const Icon(Icons.search)),
            IconButton(
                onPressed: (){
              AppCubit.get(context).changeAppMode(fromShared: null);
              },
                icon: const Icon(Icons.brightness_4_outlined))

          ],
        ),
          bottomNavigationBar: BottomNavigationBar(
          onTap: (index){
            cubit.changeBottomNavBar(index);
          },
          currentIndex: cubit.currenIndex,
          items:cubit.bottomItems,
          ),
            body: cubit.ListWidgetLayoutScreens[cubit.currenIndex],


      );
      },
      listener: (BuildContext context, NewStates state) {  },

    );
  }

}