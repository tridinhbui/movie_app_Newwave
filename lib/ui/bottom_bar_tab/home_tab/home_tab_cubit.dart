import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_counter/ui/bottom_bar_tab/home_tab/home_tab.dart';
import 'package:meta/meta.dart';

part 'home_tab_state.dart';

class HomeTabCubit extends Cubit<HomeTabState> {
  HomeTabCubit() : super(HomeTabState(upComingList: []));

  void searchUpcomingList(
      String enteredKeyword, List<FilmEntity> upcomingList) {
    if (enteredKeyword.isEmpty) {
      emit(state.copyWith(upComingList: upcomingList));
    } else {
      emit(state.copyWith(
          upComingList: upcomingList
              .where((film) =>
                  film.filmName
                      ?.toLowerCase()
                      .contains(enteredKeyword.toLowerCase()) ??
                  true)
              .toList()));
    }
  }
}
