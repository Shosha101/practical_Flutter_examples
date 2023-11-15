abstract class NewStates{}
class NewInitialState extends NewStates{}
class NewBottomNavState extends NewStates{}
class NewsGetBusinessLoadingState extends NewStates{}
class NewsGetBusinessSuccessState extends NewStates{}
class NewsGetBusinessErrorsState extends NewStates {
final String error;
NewsGetBusinessErrorsState(this.error);
}


class NewsGetSportsLoadingState extends NewStates{}
class NewsGetSportsSuccessState extends NewStates{}
class NewsGetSportsErrorsState extends NewStates {
  final String error;
  NewsGetSportsErrorsState(this.error);
}


class NewsGetScienceLoadingState extends NewStates{}
class NewsGetScienceSuccessState extends NewStates{}
class NewsGetScienceErrorsState extends NewStates {
  final String error;
  NewsGetScienceErrorsState(this.error);
}


class NewsGetSearchLoadingState extends NewStates{}
class NewsGetSearchSuccessState extends NewStates{}
class NewsGetSearchErrorsState extends NewStates {
  final String error;
  NewsGetSearchErrorsState(this.error);
}

