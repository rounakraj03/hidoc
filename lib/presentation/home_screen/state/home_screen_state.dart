import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'home_screen_state.freezed.dart';

@freezed
class HomeScreenState with _$HomeScreenState {
  const factory HomeScreenState({
    @Default(false) bool isLoading,
    @Default([]) List news,
    @Default([]) List trandingBulletin,
    @Default("") specialityName,
    @Default([]) List latestArticle,
    @Default([]) List exploreArticle,
    @Default([]) List trandingArticle,
    @Default({}) Map article,
    @Default({"articleTitle":"","redirectLink":"","articleDescription":"","rewardPoints":0,"articleImg":"","createdAt":"2022-12-30 12:46:26"}) Map selectedArticle,
    @Default([]) List bulletin,
    @Default(0) int sID,
    @Default(3) int defaultState,
  }) =
      _HomeScreenState;
}
