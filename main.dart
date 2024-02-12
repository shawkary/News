import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/layout/news_app/main_cubit/main_states.dart';
import 'package:flutter_project/shared/components/constants.dart';
import 'package:flutter_project/shared/cubit/cubit.dart';
import 'package:flutter_project/shared/network/local/cache_helper.dart';
import 'package:flutter_project/shared/network/remote/dio_helper.dart';
import 'package:flutter_project/shared/styles/themes.dart';
import 'layout/news_app/cubit/cubit.dart';
import 'layout/news_app/main_cubit/main_cubit.dart';
import 'layout/news_app/news_layout.dart';
import 'modules/users/users_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();

  bool ttt = CacheHelper.getData(key: 'isNotifications');
  bool isDark = CacheHelper.getData(key: 'isDark');

  // getNewsApi();


  runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<NewsCubit>(
              create: (BuildContext context) => NewsCubit()..getBusiness()..getSports()..getScience(),
          ),
          BlocProvider<MainCubit>(
              create: (BuildContext context) => MainCubit()..changeMode(
                fromShared: isDark,
              ),
          ),
        ],
          child:  MyApp(isDark)
      ));
  }

class MyApp extends StatelessWidget {
  final bool isDark;
  const MyApp(this.isDark, {super.key});

  @override
  Widget build(BuildContext context) {
        return BlocConsumer<MainCubit, MainStates>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, Object? state) {
            MainCubit cubit = MainCubit.get(context);
            return MaterialApp(
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: cubit.isDark ? ThemeMode.light: ThemeMode.dark,
              debugShowCheckedModeBanner: false,
              home:  NewsLayout(),
            );
          },
        );
  }
}
