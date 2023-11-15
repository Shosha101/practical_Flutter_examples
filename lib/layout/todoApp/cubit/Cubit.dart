import 'package:ex1/shared/network/local/cache_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../archived_tasks/archived_task_screen.dart';
import '../done_tasks/done_task_screen.dart';
import '../new_tasks/new_task_screen.dart';
import 'States.dart';


class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppIntialState());
  static AppCubit get(context) => BlocProvider.of(context);
  List<Widget> widget_lay_screens = [
    new_tasks_screen(),
    done_tasks_screen(),
    archived_tasks_screen()
  ];
  List<String> Names_lay_screens = ["NEW", "DONE", "ARCHIVED"];
  var currentIndex = 0;
  late Database myDb; //mydb instance will be get an value soon not now ,not a nullable var but can get null value now
  List New_tasks_map=[];
  List Done_tasks_map=[];
  List Archived_tasks_map=[];


  void ChangIndex(int index) {
    currentIndex = index;
    emit(AppBottomNavigationBarChange());
  }

  //---------------------------------------------------------------//
  //methods for data base
  void create_DB() {
    openDatabase(
      'todo3.db',
      version: 3,
      onCreate: (dbObjCreate, version) {
        dbObjCreate
            .execute(
                'CREATE TABLE task(id INTEGER PRIMARY KEY,title TEXT,date TEXT,time TEXT, status TEXT )')
            .then((value) {
          print("created table");
          return null;
        }).catchError((onError) {
          print("Error when create table");
        });
      },
      onOpen: (dbObjOnopen) {
        getFrom_Data_Base(dbObjOnopen);
      print("database opened");

      },

    ).then((value) {
      myDb = value;
      emit(AppCreateDbState());
      print(" add new record $myDb ");

    });
  } //wizard data base


   inserTo_Data_Base
       (
      {
        required String title,
        required String date,
        required String time
      }

       ) async {
        await myDb.transaction((txn){
                    txn.rawInsert(
                'INSERT INTO task(title,date,time,status)VALUES("$title","$date","$time","new")')
            .then((value) {
          print("$value inserted successfully");
          emit(AppInsertDBState());
          getFrom_Data_Base(myDb);
            emit(AppGetDBState());

          }).catchError((onError) {
            print("there is a problem.");
          });
          return Future(() => null);

        }).catchError((error) {
          print("Error when creating table ..${error.toString()}");
        });

      }

  void UpdateData({required String status,required int id}) async
  {
    return await myDb.rawUpdate('UPDATE task SET status=? WHERE id=?',['$status',id]).then
      ((value) {
        getFrom_Data_Base(myDb);
      emit(AppUpdateDBState()) ;
    });

  }
  //-------------------------------------------------------------//

  void getFrom_Data_Base(myDb)  {
    emit(AppGetDBLoadState());

     New_tasks_map=[];
     Done_tasks_map=[];
     Archived_tasks_map=[];

    myDb.rawQuery('SELECT * FROM task').then((value) {

      value.forEach((element) {

        if(element['status']=='new'){
          New_tasks_map.add(element);
          print(("add to new map"));
          emit(AppGetDBState());


        }else if(element['status']=='done'){
          Done_tasks_map.add(element);
          print(("add to done map"));
          emit(AppGetDBState());


        }else{
          Archived_tasks_map.add(element);
          print(("add to archived  map"));
          emit(AppGetDBState());


        }


      });

    });

  }

//-------------------------------------------------------------//
  //methods of background operation
  Future<String> addNewProduct() async {
    return "  ahmed mohamed ibrahim";
  }



  bool isBottomSheetShown = false;
  IconData FbI = Icons.edit;
  void changeBottomState({required bool isShow,required IconData icon}){
    isBottomSheetShown=isShow;
    FbI=icon;
    emit(AppBottomSheetChange());
  }

  void DeleteData({required int id}) async
  {
    return await myDb.rawUpdate('DELETE FROM task WHERE   id=?',[id]).then
      ((value) {
      getFrom_Data_Base(myDb);
      emit(AppDeleteDBState()) ;
    });

  }


  bool isDark=false;
  void changeAppMode({ bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared; // if there is bool value preserve it and save this value to don't make changes in the toggle of theme mode
      emit(AppGetModeState());

    } else {
      //if there isn't bool value  put new value to  make changes in the toggle of theme mode
      isDark = !isDark;

      CacheHelper.putBool(key: "isDark", value: isDark).then((value) {
        emit(AppGetModeState());
      });
    }


  }


  }




