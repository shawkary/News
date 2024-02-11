import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/layout/news_app/cubit/cubit.dart';
import 'package:flutter_project/layout/news_app/cubit/states.dart';
import 'package:flutter_project/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        NewsCubit cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextFormField(
                  onChanged: (value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'search',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),

                  ),
                ),
                Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) => defaultNewsItem(cubit.search[index], context),
                      separatorBuilder: (context, index) => defaultSeparator(),
                      itemCount: cubit.search.length,
                )),
              ],
            ),
          ),
        );
      },
    );
  }
}
