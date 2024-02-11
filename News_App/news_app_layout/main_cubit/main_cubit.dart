import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/layout/news_app/main_cubit/main_states.dart';
import 'package:flutter_project/shared/network/local/cache_helper.dart';

class MainCubit extends Cubit<MainStates>
{
  MainCubit(): super(InitialMainState());
  static MainCubit get(context) => BlocProvider.of(context);


  bool isDark = false;
  void changeMode({fromShared})
  {
    if(fromShared != null){
      isDark = fromShared;
      emit(ChangeModeMainsState());
    }else {
      isDark = !isDark;
      CacheHelper.saveData(key: 'isDark', value: isDark).then((value) {
        emit(ChangeModeMainsState());
      });
    }
  }
}