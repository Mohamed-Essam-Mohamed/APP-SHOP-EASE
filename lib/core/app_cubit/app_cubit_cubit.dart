import 'package:app_shop_ease/core/constant/app_keys_shared_pref.dart';
import 'package:app_shop_ease/core/utils/app_shared_preference.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_cubit_state.dart';

class AppCubitCubit extends Cubit<AppCubitState> {
  AppCubitCubit() : super(AppCubitInitial());

  AppCubitCubit get(context) => BlocProvider.of(context);

  var lang =
      SharedPreferencesUtils.getData(key: AppKeysSharedPref.lang) ?? 'en';
  void changeLang() async {
    if (lang == 'en') {
      lang = 'ar';
      await SharedPreferencesUtils.saveData(
          key: AppKeysSharedPref.lang, value: 'ar');
      emit(AppChangeLangToAR());
    } else {
      lang = 'en';
      await SharedPreferencesUtils.saveData(
          key: AppKeysSharedPref.lang, value: 'en');
      emit(AppChangeLangToEN());
    }
  }
}
