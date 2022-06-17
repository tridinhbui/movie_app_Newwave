import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_counter/repositories/movies_responses.dart';

import '../../networks/network.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());

  void initialAPI() async {
    emit(state.copyWith(isLoaded: false));
    final result = await getMovies();
    emit(state.copyWith(movieResponse: result, isLoaded: true));
  }


}
