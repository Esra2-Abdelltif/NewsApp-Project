import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp_project/shared/Bloc/cubit.dart';
import 'package:newsapp_project/shared/Bloc/states.dart';
import 'package:newsapp_project/shared/Componeds/companed.dart';

class SearchScreen extends StatelessWidget {

var Searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (BuildContext context,NewsStates state)
      {

      },
      builder:  (BuildContext context,NewsStates state){
        var list = NewsCubit.get(context).Search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                    validator: (value){
                      if(value.isEmpty)
                        return 'Search must be not empty';
                      return null;
                    },
                    onSaved:(value){
                      Searchcontroller = value as TextEditingController;
                    },
                    onChanged: (value){
                      NewsCubit.get(context).getSearch(value);
                    },
                    controller: Searchcontroller,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange,),
                        // borderRadius: BorderRadius.circular(25.0),
                      ),
                      labelText: 'Search',
                      hintText: 'Search',
                      labelStyle: TextStyle(color: Colors.deepOrange),
                      prefixIcon: Icon(Icons.search, color: Colors.deepOrange,),
                      border: OutlineInputBorder(),
                    )

                ),
              ),
              Expanded(child: BuildNewsItems(context: context,article:list)),
            ],
          ),);
      },
    );

  }
}
