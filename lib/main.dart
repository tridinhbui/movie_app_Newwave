import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/generated/l10n.dart';
import 'package:flutter_counter/ui/app_cubit/app_cubit.dart';
import 'package:flutter_counter/ui/bottom_bar_tab/home_tab/home_tab_cubit.dart';
import 'package:flutter_counter/ui/bottom_bar_widget/bottom_bar_cubit.dart';

import 'package:flutter_counter/ui/home/home_cubit.dart';
import 'package:flutter_counter/ui/home/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MovieApp());
}

class MovieApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => BottomBarCubit(),
        ),
        BlocProvider(create: (context) => AppCubit()),
        BlocProvider(create: (context) => HomeTabCubit())
      ],
      child: BlocBuilder<AppCubit, AppState>(
        buildWhen: (previous, current) {
          return previous.themeMode != current.themeMode ||
              previous.lang != current.lang;
        },
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: state.themeMode,
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: changeLanguage(state.lang),
            home: HomePage(),
          );
        },
      ),
    );
  }

  Locale changeLanguage(String lang) {
    return Locale(lang);
  }
}
