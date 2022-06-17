import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState(themeMode: ThemeMode.system, upcomingList: []));

  void changeTheme() {
    emit(state.copyWith(
        themeMode: state.themeMode != ThemeMode.dark
            ? ThemeMode.dark
            : ThemeMode.light));
  }

  void changeLanguage(String lang) {
    emit(state.copyWith(lang: lang));
  }


}
