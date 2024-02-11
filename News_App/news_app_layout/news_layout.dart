import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/layout/news_app/cubit/cubit.dart';
import 'package:flutter_project/layout/news_app/cubit/states.dart';
import 'package:flutter_project/layout/news_app/main_cubit/main_cubit.dart';
import 'package:flutter_project/shared/components/components.dart';

import '../../modules/News_App/search_screen/search_screen.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});


  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          NewsCubit cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              leadingWidth: 100,
              centerTitle: true,
              leading: Padding(
                padding: const EdgeInsets.only(left: 12),
                  child: cubit.hhh(),
              ),
              title: const Text(
                'Latest News',
              ),
              actions: [
                IconButton(
                    icon:const Icon(Icons.search),
                    onPressed: ()
                  {
                    navigateTo(context, const SearchScreen());
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                  icon: const Icon(Icons.brightness_4_outlined),
                  onPressed: ()
                  {
                      MainCubit.get(context).changeMode();
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index){
                cubit.changeIndex(index);
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.business),label: 'Business'),
                BottomNavigationBarItem(icon: Icon(Icons.science),label: 'Science'),
                BottomNavigationBarItem(icon: Icon(Icons.sports_esports),label: 'Sports'),
              ],
            ),
          );
        }
    );
  }
}
