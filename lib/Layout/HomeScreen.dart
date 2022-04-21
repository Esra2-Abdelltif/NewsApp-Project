// import 'package:conditional_builder/conditional_builder.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp_project/shared/Bloc/cubit.dart';
import 'package:newsapp_project/shared/Bloc/states.dart';

class HomeScreen extends StatelessWidget {
 // const ({Key key}) : super(key: key);

 
  var ScaffoldKey = GlobalKey<ScaffoldState>();
  var FormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(//.. bt5lny ader acesse 3la ele da5l NewsCubit
        create:(BuildContext context)=>NewsCubit(),
        child:BlocConsumer<NewsCubit,NewsStates>(
            listener: (BuildContext context,NewsStates state)
            {

            },
            builder: (BuildContext context ,NewsStates state) {
              NewsCubit cubit = NewsCubit.get(context);
              return Scaffold(
                  key: ScaffoldKey,
                  appBar: AppBar(
                    title: Text('News App'),
                    actions: [
                      IconButton(onPressed: (){}, icon:Icon( Icons.search))
                    ],
                  ),
                  bottomNavigationBar: BottomNavigationBar(
                    items: cubit.bottomNavigation,
                    currentIndex: cubit.CurrentIndex,
                    onTap: (index) {
                      cubit.ChangeIndex(index);
                    },
                  ),
                  body: cubit.Screen[cubit.CurrentIndex]

              );
            }

        ),
              );
  }


}
