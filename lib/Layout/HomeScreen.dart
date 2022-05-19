// import 'package:conditional_builder/conditional_builder.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp_project/modules/SearchScreen/SearchScreen.dart';
import 'package:newsapp_project/shared/Bloc/cubit.dart';
import 'package:newsapp_project/shared/Bloc/states.dart';
import 'package:newsapp_project/shared/Constans/constans.dart';

class HomeScreen extends StatelessWidget {
 // const ({Key key}) : super(key: key);

 
  var ScaffoldKey = GlobalKey<ScaffoldState>();
  var FormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
        listener: (BuildContext context,NewsStates state)
        {
        },
        builder: (BuildContext context ,NewsStates state)
        {
          NewsCubit cubit = NewsCubit.get(context);
          return Scaffold(
              key: ScaffoldKey,
              appBar: AppBar(
                title: Text('News App'),
                actions: [
                  IconButton(onPressed: ()=>NavigateTo(context: context,router: SearchScreen()), icon:Icon( Icons.search))
                ],
              ),
              body: cubit.Screen[cubit.CurrentIndex],
            bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomNavigation,
            currentIndex: cubit.CurrentIndex,
            onTap: (index) {
              cubit.ChangeIndex(index);
            },
          ),


          );
        }

    );
  }


}
