part of 'home_tab_cubit.dart';

@immutable
class HomeTabState extends Equatable {
  List<FilmEntity> upComingList;

  HomeTabState({required this.upComingList});

  HomeTabState copyWith({
    List<FilmEntity>? upComingList,
  }) {
    return HomeTabState(
      upComingList: upComingList ?? this.upComingList,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [upComingList];
}
