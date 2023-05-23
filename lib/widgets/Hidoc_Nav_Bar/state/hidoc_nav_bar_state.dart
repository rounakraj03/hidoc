import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'hidoc_nav_bar_state.freezed.dart';

@freezed
class HidocNavBarState with _$HidocNavBarState {
  const factory HidocNavBarState({
    @Default([false,false,false,false,false,false,false,false,false,false]) List hoverValue,
    @Default([false,false,false,false,false]) List forDoctorsListSelected,
    @Default([false, false]) List isDropDownSelected,
  }) =
      _HidocNavBarState;
}
