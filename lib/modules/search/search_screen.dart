import 'package:ex1/layout/newsApp/cubit/news_cubit.dart';
import 'package:ex1/layout/newsApp/cubit/states.dart';
import 'package:ex1/shared/components/component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Search_Screen extends StatelessWidget{

  var searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
   return BlocConsumer<NewsCubit,NewStates>(
       builder: (BuildContext context, NewStates state) {
         var list=NewsCubit.get(context).listSearch;
       return Scaffold(
       appBar: AppBar(),
       body: Column(
         children: [
           Padding(
             padding: const EdgeInsets.all(20.0),
             child: default_textForm(
                 radius: 20,
                 BorderSideColor: Colors.deepOrange,
                 labelColor: Colors.deepOrange,
                 textColor: Colors.black,
                 cursorColor: Colors.deepOrange,
                 IconButtonColorPreffix: Colors.deepOrange,

                 controller: searchController,
                 onChanged:(value) {
                NewsCubit.get(context).getSearch(value);
                 },
                 keyboardtype: TextInputType.text,
                 validate:(String ?value){
                   if(value!.isEmpty){
                     return"search must not be empty";
                   }
                   return null;

                 }
                 ,
                 label: "Search",
                 prefix: CupertinoIcons.search
             ),
           ),
           Expanded(child: articleBuilder(list, context))
         ],
       ),
       );
       }
     , listener: (BuildContext context, NewStates state) {  },

   );
  }
}