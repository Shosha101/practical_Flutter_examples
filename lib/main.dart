import 'package:bloc/bloc.dart';
import 'package:ex1/layout/newsApp/news_layout.dart';
import 'package:ex1/layout/todoApp/cubit/Cubit.dart';
import 'package:ex1/layout/todoApp/cubit/States.dart';
import 'package:ex1/shared/bloc_observer.dart';
import 'package:ex1/shared/network/local/cache_helper.dart';
import 'package:ex1/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import 'layout/newsApp/cubit/news_cubit.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark=CacheHelper.getBool(key: "isDark");

  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {

    final bool ?isDark;
    MyApp(this.isDark);




  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>NewsCubit()..getBusiness()..getSports()..getScience()),
        BlocProvider(create: (context)=>AppCubit()..changeAppMode(
          fromShared: isDark
        ))

      ],
      child: BlocConsumer<AppCubit,AppStates>(
        builder: (BuildContext context, AppStates state) {
          return MaterialApp(


          debugShowCheckedModeBanner: false,
          home:Directionality(textDirection: TextDirection.ltr,
              child: news_layout()),
          theme: ThemeData(
              primarySwatch:Colors.deepOrange,
              textTheme: TextTheme( bodyLarge:TextStyle(fontSize: 18.0,color: Colors.black,fontWeight: FontWeight.w600), ),
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                titleSpacing: 20,
                  iconTheme: IconThemeData(color: Colors.black),
                  titleTextStyle:TextStyle( color:Colors.black,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                  elevation: 0.0,
                  backgroundColor: Colors.white,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                  )
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  unselectedItemColor: Colors.black45,
                  backgroundColor: Colors.white70,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,
                  elevation: 20
              )

          ),
          darkTheme: ThemeData(


              scaffoldBackgroundColor: HexColor('333739'),
              textTheme: const TextTheme( bodyLarge:TextStyle(fontSize: 18.0,color: Colors.white,fontWeight: FontWeight.w600) ),
              primarySwatch:Colors.deepOrange,
              appBarTheme: AppBarTheme(
                  titleSpacing: 20,
                  iconTheme: const IconThemeData(color: Colors.white),
                  titleTextStyle:const TextStyle( color:Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                  elevation: 25,
                  backgroundColor: HexColor('333739'),
                  systemOverlayStyle: const SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                  )
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  unselectedItemColor: Colors.grey,
                  backgroundColor: HexColor('333739'),

                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,
                  elevation: 20
              )


          ),
          themeMode: AppCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,





        );
        },
        listener: (BuildContext context, AppStates state) {  },
      ),
    );

  }
}
