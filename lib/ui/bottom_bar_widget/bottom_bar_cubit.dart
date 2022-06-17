import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../bottom_bar_tab/comment_tab/comment_tab_page.dart';
import '../bottom_bar_tab/home_tab/home_tab.dart';
import 'bottom_bar_widget.dart';

part 'bottom_bar_state.dart';

class BottomBarCubit extends Cubit<BottomBarState> {
  BottomBarCubit() : super(BottomBarState());
}
