// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hidoc_nav_bar_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HidocNavBarState {
  List<dynamic> get hoverValue => throw _privateConstructorUsedError;
  List<dynamic> get forDoctorsListSelected =>
      throw _privateConstructorUsedError;
  List<dynamic> get isDropDownSelected => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HidocNavBarStateCopyWith<HidocNavBarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HidocNavBarStateCopyWith<$Res> {
  factory $HidocNavBarStateCopyWith(
          HidocNavBarState value, $Res Function(HidocNavBarState) then) =
      _$HidocNavBarStateCopyWithImpl<$Res, HidocNavBarState>;
  @useResult
  $Res call(
      {List<dynamic> hoverValue,
      List<dynamic> forDoctorsListSelected,
      List<dynamic> isDropDownSelected});
}

/// @nodoc
class _$HidocNavBarStateCopyWithImpl<$Res, $Val extends HidocNavBarState>
    implements $HidocNavBarStateCopyWith<$Res> {
  _$HidocNavBarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hoverValue = null,
    Object? forDoctorsListSelected = null,
    Object? isDropDownSelected = null,
  }) {
    return _then(_value.copyWith(
      hoverValue: null == hoverValue
          ? _value.hoverValue
          : hoverValue // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      forDoctorsListSelected: null == forDoctorsListSelected
          ? _value.forDoctorsListSelected
          : forDoctorsListSelected // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      isDropDownSelected: null == isDropDownSelected
          ? _value.isDropDownSelected
          : isDropDownSelected // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HidocNavBarStateCopyWith<$Res>
    implements $HidocNavBarStateCopyWith<$Res> {
  factory _$$_HidocNavBarStateCopyWith(
          _$_HidocNavBarState value, $Res Function(_$_HidocNavBarState) then) =
      __$$_HidocNavBarStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<dynamic> hoverValue,
      List<dynamic> forDoctorsListSelected,
      List<dynamic> isDropDownSelected});
}

/// @nodoc
class __$$_HidocNavBarStateCopyWithImpl<$Res>
    extends _$HidocNavBarStateCopyWithImpl<$Res, _$_HidocNavBarState>
    implements _$$_HidocNavBarStateCopyWith<$Res> {
  __$$_HidocNavBarStateCopyWithImpl(
      _$_HidocNavBarState _value, $Res Function(_$_HidocNavBarState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hoverValue = null,
    Object? forDoctorsListSelected = null,
    Object? isDropDownSelected = null,
  }) {
    return _then(_$_HidocNavBarState(
      hoverValue: null == hoverValue
          ? _value._hoverValue
          : hoverValue // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      forDoctorsListSelected: null == forDoctorsListSelected
          ? _value._forDoctorsListSelected
          : forDoctorsListSelected // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      isDropDownSelected: null == isDropDownSelected
          ? _value._isDropDownSelected
          : isDropDownSelected // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc

class _$_HidocNavBarState implements _HidocNavBarState {
  const _$_HidocNavBarState(
      {final List<dynamic> hoverValue = const [
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false
      ],
      final List<dynamic> forDoctorsListSelected = const [
        false,
        false,
        false,
        false,
        false
      ],
      final List<dynamic> isDropDownSelected = const [false, false]})
      : _hoverValue = hoverValue,
        _forDoctorsListSelected = forDoctorsListSelected,
        _isDropDownSelected = isDropDownSelected;

  final List<dynamic> _hoverValue;
  @override
  @JsonKey()
  List<dynamic> get hoverValue {
    if (_hoverValue is EqualUnmodifiableListView) return _hoverValue;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hoverValue);
  }

  final List<dynamic> _forDoctorsListSelected;
  @override
  @JsonKey()
  List<dynamic> get forDoctorsListSelected {
    if (_forDoctorsListSelected is EqualUnmodifiableListView)
      return _forDoctorsListSelected;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_forDoctorsListSelected);
  }

  final List<dynamic> _isDropDownSelected;
  @override
  @JsonKey()
  List<dynamic> get isDropDownSelected {
    if (_isDropDownSelected is EqualUnmodifiableListView)
      return _isDropDownSelected;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_isDropDownSelected);
  }

  @override
  String toString() {
    return 'HidocNavBarState(hoverValue: $hoverValue, forDoctorsListSelected: $forDoctorsListSelected, isDropDownSelected: $isDropDownSelected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HidocNavBarState &&
            const DeepCollectionEquality()
                .equals(other._hoverValue, _hoverValue) &&
            const DeepCollectionEquality().equals(
                other._forDoctorsListSelected, _forDoctorsListSelected) &&
            const DeepCollectionEquality()
                .equals(other._isDropDownSelected, _isDropDownSelected));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_hoverValue),
      const DeepCollectionEquality().hash(_forDoctorsListSelected),
      const DeepCollectionEquality().hash(_isDropDownSelected));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HidocNavBarStateCopyWith<_$_HidocNavBarState> get copyWith =>
      __$$_HidocNavBarStateCopyWithImpl<_$_HidocNavBarState>(this, _$identity);
}

abstract class _HidocNavBarState implements HidocNavBarState {
  const factory _HidocNavBarState(
      {final List<dynamic> hoverValue,
      final List<dynamic> forDoctorsListSelected,
      final List<dynamic> isDropDownSelected}) = _$_HidocNavBarState;

  @override
  List<dynamic> get hoverValue;
  @override
  List<dynamic> get forDoctorsListSelected;
  @override
  List<dynamic> get isDropDownSelected;
  @override
  @JsonKey(ignore: true)
  _$$_HidocNavBarStateCopyWith<_$_HidocNavBarState> get copyWith =>
      throw _privateConstructorUsedError;
}
