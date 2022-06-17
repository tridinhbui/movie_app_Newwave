import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/ui/app_cubit/app_cubit.dart';
import 'package:flutter_counter/ui/bottom_bar_tab/ticket_tab/ticket_tab_page.dart';

import '../../generated/l10n.dart';
import '../bottom_bar_tab/account_tab/account_tab_page.dart';
import '../bottom_bar_tab/comment_tab/comment_tab_page.dart';
import '../bottom_bar_tab/home_tab/home_tab.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({Key? key}) : super(key: key);

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  int pageView = 0;
  PageController controller = PageController();
  bool isThemeDark = false;
  List<Widget> listPages = [
    HomeTab(),
    CommentTab(),
    TicketTab(),
    AccountTab(),
  ];
  List<CustomBottomItem> listBottomItems = [
    CustomBottomItem(
      icon: Image.asset(
        "assets/icons/home_page_icon.png",
        height: 20,
        width: 20,
        fit: BoxFit.fill,
        color: Colors.white70,
      ),
      label: S.current.home,
    ),
    CustomBottomItem(
      icon: Image.asset(
        "assets/icons/heart_icon.png",
        height: 20,
        width: 20,
        fit: BoxFit.fill,
        color: Colors.white70,
      ),
      label: S.current.comment,
    ),
    CustomBottomItem(
      icon: Image.asset(
        "assets/icons/ticket_icon.png",
        height: 20,
        width: 20,
        fit: BoxFit.fill,
        color: Colors.white70,
      ),
      label: S.current.ticket,
    ),
    CustomBottomItem(
      icon: Image.asset(
        "assets/icons/user_icon.png",
        height: 20,
        width: 20,
        fit: BoxFit.fill,
        color: Colors.white70,
      ),
      label: S.current.users,
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      buildWhen: (pre, cur) => pre.themeMode != cur.themeMode,
      builder: (context, state) {
          listBottomItems.clear();
          isThemeDark = state.themeMode == ThemeMode.dark ? true : false;
          listBottomItems = [
            CustomBottomItem(
              icon: Image.asset(
                "assets/icons/home_page_icon.png",
                height: 20,
                width: 20,
                fit: BoxFit.fill,
                color: isThemeDark ? Colors.white70 : Colors.black,
              ),
              label: S.of(context).home,
            ),
            CustomBottomItem(
              icon: Image.asset(
                "assets/icons/heart_icon.png",
                height: 20,
                width: 20,
                fit: BoxFit.fill,
                color: Colors.white70,
              ),
              label: S.of(context).comment,
            ),
            CustomBottomItem(
              icon: Image.asset(
                "assets/icons/ticket_icon.png",
                height: 20,
                width: 20,
                fit: BoxFit.fill,
                color: Colors.white70,
              ),
              label: S.of(context).ticket,
            ),
            CustomBottomItem(
              icon: Image.asset(
                "assets/icons/user_icon.png",
                height: 20,
                width: 20,
                fit: BoxFit.fill,
                color: Colors.white70,
              ),
              label: S.of(context).users,
            ),
          ];
        return Scaffold(
          backgroundColor: Color.fromRGBO(70, 130, 180, 0.65),
          body: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: controller,
            children: listPages,
          ),
          bottomNavigationBar: CustomBottomBar(
            isThemeDark: isThemeDark,
            items: listBottomItems,
            //isHiddenLabel: true,
            onTap: (val) {
              pageView = val;
              controller.animateToPage(val,
                  curve: Curves.decelerate,
                  duration: Duration(milliseconds: 3));
            },
          ),
        );
      },
    );
  }
}

typedef OnCallBackIndex(int index);

class CustomBottomBar extends StatefulWidget {
  final List<CustomBottomItem> items;
  final OnCallBackIndex? onTap;
  final bool isHiddenLabel;
  final bool? isThemeDark;

  const CustomBottomBar({
    Key? key,
    required this.items,
    this.onTap,
    this.isHiddenLabel = false,
    this.isThemeDark = false,
  }) : super(key: key);

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color:  (widget.isThemeDark ?? false)  ? Colors.blueAccent[450] : Colors.blue[290],
      alignment: Alignment.bottomCenter,
      height: MediaQuery.of(context).size.height * 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: widget.items
            .map((e) => Expanded(
                  child: _item(
                    icon: e.icon,
                    text: e.label,
                    onTap: () => widget.onTap?.call(
                      widget.items.indexOf(e),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }

  Widget _item({Widget? icon, String? text, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        margin: EdgeInsets.only(bottom: 5),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          icon != null ? icon : SizedBox(),
          SizedBox(height: 5),
          Visibility(
            visible: !widget.isHiddenLabel,
            child: Text(
              text ?? "",
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ]),
      ),
    );
  }
}

class CustomBottomItem {
  final Widget? icon;
  final String? label;

  CustomBottomItem({this.icon, this.label});
}
