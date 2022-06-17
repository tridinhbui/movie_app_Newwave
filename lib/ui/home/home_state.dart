part of 'home_cubit.dart';

class HomeState extends Equatable {
  final MovieResponse? movieResponse;
  final bool isLoaded;

  HomeState({this.movieResponse, this.isLoaded = true});

  HomeState copyWith({
    MovieResponse? movieResponse,
    bool? isLoaded,
  }) {
    return HomeState(
      movieResponse: movieResponse,
      isLoaded: isLoaded ?? false,
    );
  }

  @override
  List<Object?> get props => [
        movieResponse,
        isLoaded,
      ];
}
