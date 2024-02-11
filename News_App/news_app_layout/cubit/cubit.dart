import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/layout/news_app/cubit/states.dart';
import '../../../modules/News_App/business/business_screen.dart';
import '../../../modules/News_App/science/science_screen.dart';
import '../../../modules/News_App/sports/sports_screen.dart';
import '../../../shared/network/remote/dio_helper.dart';


class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit(): super(InitialNewsState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens =
  [
    const BusinessScreen(),
    const ScienceScreen(),
    const SportsScreen(),
  ];

  void changeIndex(int index)
  {
    currentIndex = index;
    emit(BottomNavNewsState());
  }

  List<String> country = ['us', 'eg', 'ca', 'fr', 'jp', 'kr'];
  String? selectedCountry = 'us';

  Widget hhh() => DropdownButtonFormField<String>(
    decoration:  InputDecoration(
      contentPadding: EdgeInsets.only(
        left: 10,
      ),
      // border: OutlineInputBorder(
      // )
    ),
    value: selectedCountry,
    items: country
      .map((e) => DropdownMenuItem(
          value: e,
          child: Text(e)))
      .toList(),
    onChanged: (e){
      selectedCountry = e;
      getBusiness();
      getScience();
      getSports();
      emit(DropDownButtonNewsState());
    },
  );

////////////////////////////////////////////////////////////

  List<dynamic> business = [];
  void getBusiness ()
  {
    emit(LoadingBusinessNewsState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':selectedCountry,
          'category':'business',
          'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
        }
    ).then((value) {
      business = value?.data['articles'];
      emit(SuccessBusinessNewsState());
    }).catchError((error){
      print(error.toString());
      emit(ErrorBusinessNewsState(error: ''));
    });
  }

  List<dynamic> science = [];
  void getScience ()
  {
    emit(LoadingScienceNewsState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':selectedCountry,
          'category':'science',
          'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
        }
    ).then((value) {
      science = value?.data['articles'];
      emit(SuccessScienceNewsState());
    }).catchError((error){
      print(error.toString());
      emit(ErrorScienceNewsState(error: ''));
    });
  }

  List<dynamic> sports = [];
  void getSports ()
  {
    emit(LoadingSportsNewsState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':selectedCountry,
          'category':'sports',
          'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
        }
    ).then((value) {
      sports = value?.data['articles'];
      emit(SuccessSportsNewsState());
    }).catchError((error){
      print(error.toString());
      emit(ErrorSportsNewsState(error: ''));
    });
  }


  List<dynamic> search = [];
  void getSearch (value)
  {
    emit(LoadingSearchNewsState());
    DioHelper.getData(
        url: 'v2/everything',
        query: {
          'q':'$value',
          'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
        }
    ).then((value) {
      search = value?.data['articles'];
      emit(GettingSearchNewsState());
    }).catchError((error){
      print(error.toString());
      emit(ErrorSearchNewsState(error: ''));
    });
  }



}

