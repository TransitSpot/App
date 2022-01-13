// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'location_lat_lng.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LocationLatLng _$LocationLatLngFromJson(Map<String, dynamic> json) {
  return _LocationLatLng.fromJson(json);
}

/// @nodoc
class _$LocationLatLngTearOff {
  const _$LocationLatLngTearOff();

  _LocationLatLng call({required double latitude, required double longitude}) {
    return _LocationLatLng(
      latitude: latitude,
      longitude: longitude,
    );
  }

  LocationLatLng fromJson(Map<String, Object> json) {
    return LocationLatLng.fromJson(json);
  }
}

/// @nodoc
const $LocationLatLng = _$LocationLatLngTearOff();

/// @nodoc
mixin _$LocationLatLng {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationLatLngCopyWith<LocationLatLng> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationLatLngCopyWith<$Res> {
  factory $LocationLatLngCopyWith(
          LocationLatLng value, $Res Function(LocationLatLng) then) =
      _$LocationLatLngCopyWithImpl<$Res>;
  $Res call({double latitude, double longitude});
}

/// @nodoc
class _$LocationLatLngCopyWithImpl<$Res>
    implements $LocationLatLngCopyWith<$Res> {
  _$LocationLatLngCopyWithImpl(this._value, this._then);

  final LocationLatLng _value;
  // ignore: unused_field
  final $Res Function(LocationLatLng) _then;

  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_value.copyWith(
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$LocationLatLngCopyWith<$Res>
    implements $LocationLatLngCopyWith<$Res> {
  factory _$LocationLatLngCopyWith(
          _LocationLatLng value, $Res Function(_LocationLatLng) then) =
      __$LocationLatLngCopyWithImpl<$Res>;
  @override
  $Res call({double latitude, double longitude});
}

/// @nodoc
class __$LocationLatLngCopyWithImpl<$Res>
    extends _$LocationLatLngCopyWithImpl<$Res>
    implements _$LocationLatLngCopyWith<$Res> {
  __$LocationLatLngCopyWithImpl(
      _LocationLatLng _value, $Res Function(_LocationLatLng) _then)
      : super(_value, (v) => _then(v as _LocationLatLng));

  @override
  _LocationLatLng get _value => super._value as _LocationLatLng;

  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_LocationLatLng(
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LocationLatLng implements _LocationLatLng {
  const _$_LocationLatLng({required this.latitude, required this.longitude});

  factory _$_LocationLatLng.fromJson(Map<String, dynamic> json) =>
      _$$_LocationLatLngFromJson(json);

  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'LocationLatLng(latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LocationLatLng &&
            (identical(other.latitude, latitude) ||
                const DeepCollectionEquality()
                    .equals(other.latitude, latitude)) &&
            (identical(other.longitude, longitude) ||
                const DeepCollectionEquality()
                    .equals(other.longitude, longitude)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(latitude) ^
      const DeepCollectionEquality().hash(longitude);

  @JsonKey(ignore: true)
  @override
  _$LocationLatLngCopyWith<_LocationLatLng> get copyWith =>
      __$LocationLatLngCopyWithImpl<_LocationLatLng>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocationLatLngToJson(this);
  }
}

abstract class _LocationLatLng implements LocationLatLng {
  const factory _LocationLatLng(
      {required double latitude,
      required double longitude}) = _$_LocationLatLng;

  factory _LocationLatLng.fromJson(Map<String, dynamic> json) =
      _$_LocationLatLng.fromJson;

  @override
  double get latitude => throw _privateConstructorUsedError;
  @override
  double get longitude => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LocationLatLngCopyWith<_LocationLatLng> get copyWith =>
      throw _privateConstructorUsedError;
}
