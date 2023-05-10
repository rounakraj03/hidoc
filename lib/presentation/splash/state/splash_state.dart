import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'splash_state.freezed.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState({Image? logo, @Default("") deviceRootedMessage}) =
      _SplashState;
}
