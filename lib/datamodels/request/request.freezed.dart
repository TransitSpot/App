// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Request _$RequestFromJson(Map<String, dynamic> json) {
  return _Request.fromJson(json);
}

/// @nodoc
class _$RequestTearOff {
  const _$RequestTearOff();

  _Request call(
      {required String customerName,
      required double customerLatitude,
      required double customerLongitude,
      required double destinationLatitude,
      required double destinationLongitude,
      required bool isExpired,
      required bool isAccepted}) {
    return _Request(
      customerName: customerName,
      customerLatitude: customerLatitude,
      customerLongitude: customerLongitude,
      destinationLatitude: destinationLatitude,
      destinationLongitude: destinationLongitude,
      isExpired: isExpired,
      isAccepted: isAccepted,
    );
  }

  Request fromJson(Map<String, Object> json) {
    return Request.fromJson(json);
  }
}

/// @nodoc
const $Request = _$RequestTearOff();

/// @nodoc
mixin _$Request {
  String get customerName => throw _privateConstructorUsedError;
  double get customerLatitude => throw _privateConstructorUsedError;
  double get customerLongitude => throw _privateConstructorUsedError;
  double get destinationLatitude => throw _privateConstructorUsedError;
  double get destinationLongitude => throw _privateConstructorUsedError;
  bool get isExpired => throw _privateConstructorUsedError;
  bool get isAccepted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestCopyWith<Request> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestCopyWith<$Res> {
  factory $RequestCopyWith(Request value, $Res Function(Request) then) =
      _$RequestCopyWithImpl<$Res>;
  $Res call(
      {String customerName,
      double customerLatitude,
      double customerLongitude,
      double destinationLatitude,
      double destinationLongitude,
      bool isExpired,
      bool isAccepted});
}

/// @nodoc
class _$RequestCopyWithImpl<$Res> implements $RequestCopyWith<$Res> {
  _$RequestCopyWithImpl(this._value, this._then);

  final Request _value;
  // ignore: unused_field
  final $Res Function(Request) _then;

  @override
  $Res call({
    Object? customerName = freezed,
    Object? customerLatitude = freezed,
    Object? customerLongitude = freezed,
    Object? destinationLatitude = freezed,
    Object? destinationLongitude = freezed,
    Object? isExpired = freezed,
    Object? isAccepted = freezed,
  }) {
    return _then(_value.copyWith(
      customerName: customerName == freezed
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerLatitude: customerLatitude == freezed
          ? _value.customerLatitude
          : customerLatitude // ignore: cast_nullable_to_non_nullable
              as double,
      customerLongitude: customerLongitude == freezed
          ? _value.customerLongitude
          : customerLongitude // ignore: cast_nullable_to_non_nullable
              as double,
      destinationLatitude: destinationLatitude == freezed
          ? _value.destinationLatitude
          : destinationLatitude // ignore: cast_nullable_to_non_nullable
              as double,
      destinationLongitude: destinationLongitude == freezed
          ? _value.destinationLongitude
          : destinationLongitude // ignore: cast_nullable_to_non_nullable
              as double,
      isExpired: isExpired == freezed
          ? _value.isExpired
          : isExpired // ignore: cast_nullable_to_non_nullable
              as bool,
      isAccepted: isAccepted == freezed
          ? _value.isAccepted
          : isAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$RequestCopyWith<$Res> implements $RequestCopyWith<$Res> {
  factory _$RequestCopyWith(_Request value, $Res Function(_Request) then) =
      __$RequestCopyWithImpl<$Res>;
  @override
  $Res call(
      {String customerName,
      double customerLatitude,
      double customerLongitude,
      double destinationLatitude,
      double destinationLongitude,
      bool isExpired,
      bool isAccepted});
}

/// @nodoc
class __$RequestCopyWithImpl<$Res> extends _$RequestCopyWithImpl<$Res>
    implements _$RequestCopyWith<$Res> {
  __$RequestCopyWithImpl(_Request _value, $Res Function(_Request) _then)
      : super(_value, (v) => _then(v as _Request));

  @override
  _Request get _value => super._value as _Request;

  @override
  $Res call({
    Object? customerName = freezed,
    Object? customerLatitude = freezed,
    Object? customerLongitude = freezed,
    Object? destinationLatitude = freezed,
    Object? destinationLongitude = freezed,
    Object? isExpired = freezed,
    Object? isAccepted = freezed,
  }) {
    return _then(_Request(
      customerName: customerName == freezed
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerLatitude: customerLatitude == freezed
          ? _value.customerLatitude
          : customerLatitude // ignore: cast_nullable_to_non_nullable
              as double,
      customerLongitude: customerLongitude == freezed
          ? _value.customerLongitude
          : customerLongitude // ignore: cast_nullable_to_non_nullable
              as double,
      destinationLatitude: destinationLatitude == freezed
          ? _value.destinationLatitude
          : destinationLatitude // ignore: cast_nullable_to_non_nullable
              as double,
      destinationLongitude: destinationLongitude == freezed
          ? _value.destinationLongitude
          : destinationLongitude // ignore: cast_nullable_to_non_nullable
              as double,
      isExpired: isExpired == freezed
          ? _value.isExpired
          : isExpired // ignore: cast_nullable_to_non_nullable
              as bool,
      isAccepted: isAccepted == freezed
          ? _value.isAccepted
          : isAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Request implements _Request {
  const _$_Request(
      {required this.customerName,
      required this.customerLatitude,
      required this.customerLongitude,
      required this.destinationLatitude,
      required this.destinationLongitude,
      required this.isExpired,
      required this.isAccepted});

  factory _$_Request.fromJson(Map<String, dynamic> json) =>
      _$$_RequestFromJson(json);

  @override
  final String customerName;
  @override
  final double customerLatitude;
  @override
  final double customerLongitude;
  @override
  final double destinationLatitude;
  @override
  final double destinationLongitude;
  @override
  final bool isExpired;
  @override
  final bool isAccepted;

  @override
  String toString() {
    return 'Request(customerName: $customerName, customerLatitude: $customerLatitude, customerLongitude: $customerLongitude, destinationLatitude: $destinationLatitude, destinationLongitude: $destinationLongitude, isExpired: $isExpired, isAccepted: $isAccepted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Request &&
            (identical(other.customerName, customerName) ||
                const DeepCollectionEquality()
                    .equals(other.customerName, customerName)) &&
            (identical(other.customerLatitude, customerLatitude) ||
                const DeepCollectionEquality()
                    .equals(other.customerLatitude, customerLatitude)) &&
            (identical(other.customerLongitude, customerLongitude) ||
                const DeepCollectionEquality()
                    .equals(other.customerLongitude, customerLongitude)) &&
            (identical(other.destinationLatitude, destinationLatitude) ||
                const DeepCollectionEquality()
                    .equals(other.destinationLatitude, destinationLatitude)) &&
            (identical(other.destinationLongitude, destinationLongitude) ||
                const DeepCollectionEquality().equals(
                    other.destinationLongitude, destinationLongitude)) &&
            (identical(other.isExpired, isExpired) ||
                const DeepCollectionEquality()
                    .equals(other.isExpired, isExpired)) &&
            (identical(other.isAccepted, isAccepted) ||
                const DeepCollectionEquality()
                    .equals(other.isAccepted, isAccepted)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(customerName) ^
      const DeepCollectionEquality().hash(customerLatitude) ^
      const DeepCollectionEquality().hash(customerLongitude) ^
      const DeepCollectionEquality().hash(destinationLatitude) ^
      const DeepCollectionEquality().hash(destinationLongitude) ^
      const DeepCollectionEquality().hash(isExpired) ^
      const DeepCollectionEquality().hash(isAccepted);

  @JsonKey(ignore: true)
  @override
  _$RequestCopyWith<_Request> get copyWith =>
      __$RequestCopyWithImpl<_Request>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RequestToJson(this);
  }
}

abstract class _Request implements Request {
  const factory _Request(
      {required String customerName,
      required double customerLatitude,
      required double customerLongitude,
      required double destinationLatitude,
      required double destinationLongitude,
      required bool isExpired,
      required bool isAccepted}) = _$_Request;

  factory _Request.fromJson(Map<String, dynamic> json) = _$_Request.fromJson;

  @override
  String get customerName => throw _privateConstructorUsedError;
  @override
  double get customerLatitude => throw _privateConstructorUsedError;
  @override
  double get customerLongitude => throw _privateConstructorUsedError;
  @override
  double get destinationLatitude => throw _privateConstructorUsedError;
  @override
  double get destinationLongitude => throw _privateConstructorUsedError;
  @override
  bool get isExpired => throw _privateConstructorUsedError;
  @override
  bool get isAccepted => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RequestCopyWith<_Request> get copyWith =>
      throw _privateConstructorUsedError;
}
