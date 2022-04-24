import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp_project/shared/theme/Bloc/states.dart';


class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(InitialAppState());
  static  AppCubit get(context) => BlocProvider.of(context);

  bool IsDark=false;
  void ChangeAppMode(){
    IsDark = !IsDark;
    emit(AppChangeModeState());
  }




}
