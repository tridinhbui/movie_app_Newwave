import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/ui/app_cubit/app_cubit.dart';
import 'package:flutter_counter/ui/home/home_cubit.dart';

import '../bottom_bar_widget/bottom_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  HomeCubit homeCubit = HomeCubit();
  AppCubit appCubit = AppCubit();

  List<String> popularList = [
    "assets/film_image/phim4.jpeg",
    "assets/film_image/phim5.jpeg",
    "assets/film_image/phim7.jpeg",
    "assets/film_image/phim8.jpeg",
  ];

  @override
  void initState() {
    homeCubit.initialAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        bloc: homeCubit,
        buildWhen: (pre, cur) {
          return pre.isLoaded != cur.isLoaded;
        },
        builder: (context, state) {
          return Scaffold(
            body: BottomBarWidget(),
          );
        });
  }
}
