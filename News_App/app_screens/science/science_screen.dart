import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/layout/news_app/cubit/cubit.dart';
import 'package:flutter_project/layout/news_app/cubit/states.dart';
import 'package:flutter_project/shared/components/components.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (BuildContext context, Object? state) {},
      builder: (BuildContext context, state) {
        NewsCubit cubit = NewsCubit.get(context);
        return BuildCondition(
          condition: cubit.science.isNotEmpty,
          builder: (context) => ListView.separated(
            itemBuilder: (context, index) => defaultNewsItem(cubit.science[index],context),
            separatorBuilder: (context, index) => defaultSeparator(),
            itemCount: 10,
          ),
          fallback: (context) => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
