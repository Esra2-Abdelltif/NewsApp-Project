import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp_project/shared/theme/Bloc/cubit.dart';
import 'package:newsapp_project/shared/theme/Bloc/states.dart';
class Setting extends StatelessWidget {
  const Setting({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 24,
          ),
          Text('General Setting',
              style: TextStyle(color: Color(0xFF8D8E98), fontSize: 18)
          ),
          SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Icon(
                  Icons.brightness_2_outlined,
                  color: Colors.white,
                  size: 25,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text('Dark Mode',
                style: Theme.of(context).textTheme.bodyText2,),
              Spacer(),
              SwitchTheme(),


            ],
          ),
        ],
      ),
    );
  }

}
class SwitchTheme extends StatelessWidget {
  const SwitchTheme({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer< AppCubit, AppStates>(
      listener: (BuildContext context, AppStates state) {},
      builder: (BuildContext context,  AppStates state) {
        return CupertinoSwitch(
          value: AppCubit.get(context).IsDark,
          activeColor: Theme.of(context).primaryColor,
          onChanged: (value) {
            AppCubit.get(context).ChangeAppMode();
          },
        );
      },
    );
  }
}

