part of 'app_cubit.dart';

class AppState extends Equatable {
  final ThemeMode themeMode;
  final String lang;
  final bool isThemeDark = false;

  AppState(
      {this.lang = "en",
      this.themeMode = ThemeMode.system, required List upcomingList,});

  AppState copyWith({
    ThemeMode? themeMode,
    String? lang,
    List<Map<String, dynamic>>? foundUpcomingList,
  }) {
    return AppState(
      themeMode: themeMode ?? this.themeMode,
      lang: lang ?? this.lang, upcomingList: [],
    );
  }

  @override
  List<Object?> get props => [
        themeMode,
        lang,
      ];
}
