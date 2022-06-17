import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/ui/app_cubit/app_cubit.dart';

import '../../../generated/l10n.dart';

class CommentTab extends StatefulWidget {
  const CommentTab({Key? key}) : super(key: key);

  @override
  State<CommentTab> createState() => _CommentTabState();
}

class _CommentTabState extends State<CommentTab> {
  bool isThemeDark = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
        buildWhen: (pre, cur) => pre.themeMode != cur.themeMode,
        builder: (context, state) {
          isThemeDark = state.themeMode == ThemeMode.dark ? true : false;
          return Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(138, 43, 226, 0.1),
                Color.fromRGBO(186, 85, 211, 1),
              ],
            )),
            child: Scaffold(
              backgroundColor: Color.fromRGBO(70, 130, 180, 0.65),
              appBar: AppBar(
                title: Text(S.of(context).comment),
                backgroundColor: isThemeDark? Colors.black54 : Colors.white70,
              ),
              body: Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 15, left: 20),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(70, 130, 180, 0.75),
                            border: Border.all(color: Colors.white54),
                            borderRadius:
                                BorderRadius.all(Radius.circular(13))),
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.92,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.white,
                              size: 30,
                            ),
                            suffixIcon: Icon(
                              Icons.mic,
                              color: Colors.white,
                              size: 30,
                            ),
                            hintText: S.of(context).search_comment,
                            hintStyle:
                                TextStyle(fontSize: 21, color: Colors.white70),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
