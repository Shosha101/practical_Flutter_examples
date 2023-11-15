import 'package:ex1/layout/newsApp/cubit/states.dart';
import 'package:ex1/modules/business/business_screen.dart';
import 'package:ex1/modules/science/science_screen.dart';
import 'package:ex1/modules/sports/sports_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewStates>
{

NewsCubit():super(NewInitialState());

static NewsCubit get(BuildContext context)=>BlocProvider.of(context);

int currenIndex=0;

List<BottomNavigationBarItem> bottomItems=[
  BottomNavigationBarItem(icon:Icon(Icons.business_center_rounded),label: "Business"),
  BottomNavigationBarItem(icon:Icon(Icons.sports),label: "Sports"),
  BottomNavigationBarItem(icon:Icon(Icons.science_outlined),label: "Science"),

];


void changeBottomNavBar(int indx){
  currenIndex=indx;
  if(indx==0) {
    getBusiness();
  }

  if(indx==1) {
    getSports();
  }
  if(indx==2) {
    getScience();
  }
  emit(NewBottomNavState());
}

List<Widget> ListWidgetLayoutScreens=[
  BusinessScreen(),
  SportsScreen(),
  ScienceScreen(),

];



List<dynamic> listDataBusiness=[];
void getBusiness(){

  emit(NewsGetSportsLoadingState());
  if (listDataBusiness.isEmpty){
    DioHelper.getData(
        url:  'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'business',
          'apiKey': 'f4fe045402dc41caa2035142dbf4c605',

        }).then((value) {
      // print(value?.data['articles'][0]['title']);
      listDataBusiness=value?.data['articles'];
      print(listDataBusiness[0]['title']);
      emit(NewsGetSportsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetBusinessErrorsState(error.toString()));
    });
  }else{
    emit(NewsGetSportsSuccessState());

  }

}


List<dynamic> listDataSports=[];
void getSports(){

  emit(NewsGetSportsLoadingState());

  if(listDataSports.isEmpty)
  {
    DioHelper.getData(
        url:  'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'sports',
          'apiKey': 'f4fe045402dc41caa2035142dbf4c605',

        }).then((value) {
      // print(value?.data['articles'][0]['title']);
      listDataSports=value?.data['articles'];
      print(listDataSports[0]['title']);
      emit(NewsGetSportsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetBusinessErrorsState(error.toString()));
    });
  }else{
    emit(NewsGetSportsSuccessState());

  }

}

List<dynamic> listDataScience=[];
void getScience(){

  emit(NewsGetScienceLoadingState());
  if(listDataScience.isEmpty){
    DioHelper.getData(
        url:  'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'science',
          'apiKey': 'f4fe045402dc41caa2035142dbf4c605',

        }).then((value) {
      listDataScience=value?.data['articles'];
      emit(NewsGetScienceSuccessState());
    }).catchError((error){
      emit(NewsGetScienceErrorsState(error.toString()));
    });
  }else{
    emit(NewsGetScienceSuccessState());

  }

}


List<dynamic> listSearch=[];
void getSearch(value){
    DioHelper.getData(
        url:  'v2/everything',
        query: {

          'q': '$value',
          'apiKey': 'f4fe045402dc41caa2035142dbf4c605',

        }).then((value) {
      listSearch=value?.data['articles'];
      emit(NewsGetSearchSuccessState());
    }).catchError((error){
      emit(NewsGetSearchErrorsState(error.toString()));
    });


}




}