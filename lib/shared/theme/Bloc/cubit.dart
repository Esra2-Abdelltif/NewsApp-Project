import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp_project/shared/Network/local/cacheHelper.dart';
import 'package:newsapp_project/shared/theme/Bloc/states.dart';


class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(InitialAppState());
  static  AppCubit get(context) => BlocProvider.of(context);

  bool IsDark=false;
  void ChangeAppMode({bool fromShared}){
    if(fromShared != null) {
      IsDark = fromShared;
      emit(AppChangeModeState());
    }
    else {
      IsDark = !IsDark;
      CacheHelper.putDate(key: 'IsDark', value: IsDark).then((value) {
        emit(AppChangeModeState());
      });
    }
  }




}
