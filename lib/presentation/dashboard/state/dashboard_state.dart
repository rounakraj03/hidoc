import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'dashboard_state.freezed.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState({
    @Default([]) List news,
    @Default([]) List trandingBulletin,
    @Default("") specialityName,
    @Default([]) List latestArticle,
    @Default([]) List exploreArticle,
    @Default([]) List trandingArticle,
    @Default({}) Map article,
    @Default({"articleTitle":"","redirectLink":"","articleDescription":"","rewardPoints":0,"articleImg":""}) Map selectedArticle,
    @Default([]) List bulletin,
    @Default(0) int sID,
    @Default(3) int defaultState,
  }) =
      _DashboardState;
}
