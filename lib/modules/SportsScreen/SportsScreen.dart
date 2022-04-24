import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp_project/shared/Bloc/cubit.dart';
import 'package:newsapp_project/shared/Bloc/states.dart';
import 'package:newsapp_project/shared/Componeds/companed.dart';

class SportScreen extends StatelessWidget {
  const SportScreen ({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (BuildContext context,NewsStates state)
      {
        if(state is InitialNewsStates) print('intial state');
      },
      builder: (BuildContext context ,NewsStates state) {
        var list=NewsCubit.get(context).Sport;
        return ConditionalBuilder(
          builder: (context) =>ListView.separated(
              separatorBuilder: (BuildContext context, int index) => const Divider(),
              physics: BouncingScrollPhysics(),
              itemBuilder:(context,index)=> BuildNewsItems(article:list[index],context: context),
              itemCount: list.length),
          condition:list.length>0,
          fallback: (context)=>  Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon( Icons.menu,color:Colors.deepOrange,size: 100),
                Text('No News yet...Please wait',style: Theme.of(context).textTheme.bodyText2),

              ],
            ),

          ),);
      },
    );
  }
}
