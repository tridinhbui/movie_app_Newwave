import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/generated/l10n.dart';
import 'package:flutter_counter/ui/app_cubit/app_cubit.dart';
import 'package:flutter_counter/ui/utils/app_size.dart';

import '../../genres/genres_page.dart';
import '../../movies/movies_page.dart';
import '../../theatre/theatre_page.dart';
import '../../tv_series/tv_series_page.dart';
import 'home_tab_cubit.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<FilmEntity> upcomingList = [
    FilmEntity(filmName: "1917", imageLink: "assets/film_image/phim1.jpeg"),
    FilmEntity(filmName: "The Hill", imageLink: "assets/film_image/phim2.jpeg"),
    FilmEntity(filmName: "Eternals", imageLink: "assets/film_image/phim3.jpeg"),
    FilmEntity(
        filmName: "Hai Phuong", imageLink: "assets/film_image/phim4.jpeg"),
    FilmEntity(filmName: "Star War", imageLink: "assets/film_image/phim5.jpeg"),
    FilmEntity(filmName: "Seven", imageLink: "assets/film_image/phim7.jpeg"),
    FilmEntity(filmName: "Joker", imageLink: "assets/film_image/phim8.jpeg"),
    FilmEntity(
        filmName: "Spider Man", imageLink: "assets/film_image/phim9.jpeg"),
    FilmEntity(
        filmName: "The Trip", imageLink: "assets/film_image/phim10.jpeg"),
    FilmEntity(
        filmName: "Beauty and the beast",
        imageLink: "assets/film_image/phim11.jpeg"),
  ];

  List<FilmEntity> foundList = [];

  List<String> popularList = [
    "assets/film_image/phim4.jpeg",
    "assets/film_image/phim5.jpeg",
    "assets/film_image/phim7.jpeg",
    "assets/film_image/phim8.jpeg",
  ];
  bool isTHemeDark = false;
  bool _switchValue = true;
  late AppSize appSize;
  TextEditingController controller = TextEditingController(text: "");

  @override
  void initState() {
    foundList = upcomingList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    appSize = AppSize(context);
    return BlocBuilder<AppCubit, AppState>(
      buildWhen: (pre, cur) => pre.themeMode != cur.themeMode,
      builder: (context, state) {
        isTHemeDark =
            context.read<AppCubit>().state.themeMode == ThemeMode.dark;

        return BlocBuilder<HomeTabCubit, HomeTabState>(
            buildWhen: (pre, cur) => pre.upComingList != cur.upComingList,
            builder: (context, state) {
              foundList = context.read<HomeTabCubit>().state.upComingList;

              return SingleChildScrollView(
                child: SafeArea(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 70),
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  padding: EdgeInsets.only(bottom: 12),
                                  child: Row(
                                    children: [
                                      Text(
                                        S.of(context).hello,
                                        //  "Hello, ",
                                        style: TextStyle(
                                            color: isTHemeDark
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 25),
                                      ),
                                      Text(
                                        "Trí!",
                                        style: TextStyle(
                                            color: isTHemeDark
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(bottom: 5),
                                  height: 30,
                                  width: 25,
                                  child: Image.asset(
                                    "assets/icons/bell_icon.png",
                                    height: 50,
                                    width: 50,
                                    color: isTHemeDark
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              _changeTheme(),

                              ///Change theme
                            ],
                          ),
                        ),

                        ///"Hello Tri"
                        _searchBar(),

                        ///Seach bar
                        Container(
                          margin: EdgeInsets.only(top: 25),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(S.of(context).most_pop,
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: isTHemeDark
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: FontWeight.bold))),
                        ),

                        ///"Most Popular"
                        _popularList(),

                        ///Popolar list
                        _fourButton(),

                        /// 4 buttons
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 23),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(S.of(context).up_coming,
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: isTHemeDark
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: FontWeight.bold))),
                        ),

                        ///"Upcoming release"
                        _upComingList(),

                        ///Upcoming list
                      ],
                    ),
                  ),
                ),
              );
            });
      },
    );
  }

  Widget _searchBar() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Color.fromRGBO(70, 130, 180, 0.75),
          border: Border.all(color: Colors.white54),
          borderRadius: BorderRadius.all(Radius.circular(13))),
      height: appSize.getHeight(50),
      width: double.infinity,
      child: TextFormField(
        controller: controller,
        onChanged: (val) {
          // _runFilter(val);
          context.read<HomeTabCubit>().searchUpcomingList(val, upcomingList);
          print(val);
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: isTHemeDark ? Colors.white : Colors.black,
            size: 30,
          ),
          suffixIcon: Icon(
            Icons.mic,
            color: isTHemeDark ? Colors.white : Colors.black,
            size: 30,
          ),
          hintText: S.of(context).search,
          hintStyle: TextStyle(
            fontSize: 18,
            color: isTHemeDark ? Colors.white70 : Colors.black54,
          ),
        ),
      ),
    );
  }

  Widget _popularList() {
    return Padding(
      padding: EdgeInsets.only(bottom: 10, top: 10),
      child: Container(
          height: MediaQuery.of(context).size.height * 0.23,
          child: ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            separatorBuilder: (BuildContext context, int index) => Container(
              width: appSize.getWidth(15),
            ),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: appSize.height * 0.18,
                height: appSize.height * 0.35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage(popularList[index]),
                      fit: BoxFit.fill,
                    )),
              );
            },
          )),
    );
  }

  Widget _upComingList() {
    return Container(
      height: appSize.getHeight(200),
      child: ListView.separated(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: foundList.length,
        separatorBuilder: (BuildContext context, int index) => Container(
          width: appSize.getWidth(15),
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
              width: appSize.height * 0.18,
              height: appSize.height * 0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(foundList[index].imageLink ?? "No Photo"),
                  fit: BoxFit.fill,
                ),
              ));
        },
      ),
    );
  }

  Widget _fourButton() {
    return Container(
      margin: EdgeInsets.only(top: appSize.getHeight(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () => _navigateToGenresScreen(context),
              child: _homePageButton(
                  S.of(context).genres, "assets/icons/genres_icon.png")),
          GestureDetector(
              onTap: () => _navigateToTVScreen(context),
              child: _homePageButton(
                  S.of(context).tv_series, "assets/icons/tivi_icon.png")),
          GestureDetector(
              onTap: () => _navigateToMovieScreen(context),
              child: _homePageButton(
                  S.of(context).movies, "assets/icons/movies_icon.png")),
          GestureDetector(
              onTap: () => _navigateToTheatreScreen(context),
              child: _homePageButton(
                  S.of(context).in_theore, "assets/icons/theotre_icon.png")),
        ],
      ),
    );
  }

  // void _runFilter(String enteredKeyword) {
  //   List<FilmEntity> results = [];
  //   if (enteredKeyword.isEmpty) {
  //     results = upcomingList;
  //   } else {
  //     results = upcomingList
  //         .where((user) =>
  //             user.filmName
  //                 ?.toLowerCase()
  //                 .contains(enteredKeyword.toLowerCase()) ??
  //             false)
  //         .toList();
  //   }
  //   setState(() {
  //     foundList = results;
  //   });
  // }

  void _navigateToGenresScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => GenresPage()));
  }

  void _navigateToTVScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => TVPage()));
  }

  void _navigateToMovieScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MoviesPage()));
  }

  void _navigateToTheatreScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => TheatrePage()));
  }

  Widget _homePageButton(String text, String url) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromRGBO(70, 130, 180, 0.75),
          border: Border.all(color: Colors.white54),
          borderRadius: BorderRadius.all(Radius.circular(13))),
      height: appSize.getHeight(90),
      width: appSize.getWidth(80),
      child: Center(
        child: Padding(
            padding: EdgeInsets.only(top: 15),
            child: Column(
              children: [
                Image.asset(
                  url,
                  height: 45,
                  width: 45,
                  color: isTHemeDark ? Colors.white : Colors.black,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  text,
                  style: TextStyle(
                      fontSize: 12,
                      color: isTHemeDark ? Colors.white : Colors.black),
                ),
              ],
            )),
      ),
    );
  }

  Widget _changeTheme() {
    return Switch(
      activeColor: Colors.black,
      value: _switchValue,
      onChanged: (value) {
        setState(() {
          _switchValue = value;
          context.read<AppCubit>().changeTheme();
        });
      },
    );
  }
}

class FilmEntity {
  final String? filmName;
  final String? imageLink;

  FilmEntity({this.filmName, this.imageLink});
}
