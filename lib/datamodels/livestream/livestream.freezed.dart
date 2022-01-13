// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'livestream.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Livestream _$LivestreamFromJson(Map<String, dynamic> json) {
  return _Livestream.fromJson(json);
}

/// @nodoc
class _$LivestreamTearOff {
  const _$LivestreamTearOff();

  _Livestream call(
      {required double customerLatitude,
      required double customerLongitude,
      required double driverLatitude,
      required double driverLongitude}) {
    return _Livestream(
      customerLatitude: customerLatitude,
      customerLongitude: customerLongitude,
      driverLatitude: driverLatitude,
      driverLongitude: driverLongitude,
    );
  }

  Livestream fromJson(Map<String, Object> json) {
    return Livestream.fromJson(json);
  }
}

/// @nodoc
const $Livestream = _$LivestreamTearOff();

/// @nodoc
mixin _$Livestream {
  double get customerLatitude => throw _privateConstructorUsedError;
  double get customerLongitude => throw _privateConstructorUsedError;
  double get driverLatitude => throw _privateConstructorUsedError;
  double get driverLongitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LivestreamCopyWith<Livestream> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LivestreamCopyWith<$Res> {
  factory $LivestreamCopyWith(
          Livestream value, $Res Function(Livestream) then) =
      _$LivestreamCopyWithImpl<$Res>;
  $Res call(
      {double customerLatitude,
      double customerLongitude,
      double driverLatitude,
      double driverLongitude});
}

/// @nodoc
class _$LivestreamCopyWithImpl<$Res> implements $LivestreamCopyWith<$Res> {
  _$LivestreamCopyWithImpl(this._value, this._then);

  final Livestream _value;
  // ignore: unused_field
  final $Res Function(Livestream) _then;

  @override
  $Res call({
    Object? customerLatitude = freezed,
    Object? customerLongitude = freezed,
    Object? driverLatitude = freezed,
    Object? driverLongitude = freezed,
  }) {
    return _then(_value.copyWith(
      customerLatitude: customerLatitude == freezed
          ? _value.customerLatitude
          : customerLatitude // ignore: cast_nullable_to_non_nullable
              as double,
      customerLongitude: customerLongitude == freezed
          ? _value.customerLongitude
          : customerLongitude // ignore: cast_nullable_to_non_nullable
              as double,
      driverLatitude: driverLatitude == freezed
          ? _value.driverLatitude
          : driverLatitude // ignore: cast_nullable_to_non_nullable
              as double,
      driverLongitude: driverLongitude == freezed
          ? _value.driverLongitude
          : driverLongitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$LivestreamCopyWith<$Res> implements $LivestreamCopyWith<$Res> {
  factory _$LivestreamCopyWith(
          _Livestream value, $Res Function(_Livestream) then) =
      __$LivestreamCopyWithImpl<$Res>;
  @override
  $Res call(
      {double customerLatitude,
      double customerLongitude,
      double driverLatitude,
      double driverLongitude});
}

/// @nodoc
class __$LivestreamCopyWithImpl<$Res> extends _$LivestreamCopyWithImpl<$Res>
    implements _$LivestreamCopyWith<$Res> {
  __$LivestreamCopyWithImpl(
      _Livestream _value, $Res Function(_Livestream) _then)
      : super(_value, (v) => _then(v as _Livestream));

  @override
  _Livestream get _value => super._value as _Livestream;

  @override
  $Res call({
    Object? customerLatitude = freezed,
    Object? customerLongitude = freezed,
    Object? driverLatitude = freezed,
    Object? driverLongitude = freezed,
  }) {
    return _then(_Livestream(
      customerLatitude: customerLatitude == freezed
          ? _value.customerLatitude
          : customerLatitude // ignore: cast_nullable_to_non_nullable
              as double,
      customerLongitude: customerLongitude == freezed
          ? _value.customerLongitude
          : customerLongitude // ignore: cast_nullable_to_non_nullable
              as double,
      driverLatitude: driverLatitude == freezed
          ? _value.driverLatitude
          : driverLatitude // ignore: cast_nullable_to_non_nullable
              as double,
      driverLongitude: driverLongitude == freezed
          ? _value.driverLongitude
          : driverLongitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Livestream implements _Livestream {
  const _$_Livestream(
      {required this.customerLatitude,
      required this.customerLongitude,
      required this.driverLatitude,
      required this.driverLongitude});

  factory _$_Livestream.fromJson(Map<String, dynamic> json) =>
      _$$_LivestreamFromJson(json);

  @override
  final double customerLatitude;
  @override
  final double customerLongitude;
  @override
  final double driverLatitude;
  @override
  final double driverLongitude;

  @override
  String toString() {
    return 'Livestream(customerLatitude: $customerLatitude, customerLongitude: $customerLongitude, driverLatitude: $driverLatitude, driverLongitude: $driverLongitude)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Livestream &&
            (identical(other.customerLatitude, customerLatitude) ||
                const DeepCollectionEquality()
                    .equals(other.customerLatitude, customerLatitude)) &&
            (identical(other.customerLongitude, customerLongitude) ||
                const DeepCollectionEquality()
                    .equals(other.customerLongitude, customerLongitude)) &&
            (identical(other.driverLatitude, driverLatitude) ||
                const DeepCollectionEquality()
                    .equals(other.driverLatitude, driverLatitude)) &&
            (identical(other.driverLongitude, driverLongitude) ||
                const DeepCollectionEquality()
                    .equals(other.driverLongitude, driverLongitude)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(customerLatitude) ^
      const DeepCollectionEquality().hash(customerLongitude) ^
      const DeepCollectionEquality().hash(driverLatitude) ^
      const DeepCollectionEquality().hash(driverLongitude);

  @JsonKey(ignore: true)
  @override
  _$LivestreamCopyWith<_Livestream> get copyWith =>
      __$LivestreamCopyWithImpl<_Livestream>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LivestreamToJson(this);
  }
}

abstract class _Livestream implements Livestream {
  const factory _Livestream(
      {required double customerLatitude,
      required double customerLongitude,
      required double driverLatitude,
      required double driverLongitude}) = _$_Livestream;

  factory _Livestream.fromJson(Map<String, dynamic> json) =
      _$_Livestream.fromJson;

  @override
  double get customerLatitude => throw _privateConstructorUsedError;
  @override
  double get customerLongitude => throw _privateConstructorUsedError;
  @override
  double get driverLatitude => throw _privateConstructorUsedError;
  @override
  double get driverLongitude => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LivestreamCopyWith<_Livestream> get copyWith =>
      throw _privateConstructorUsedError;
}
