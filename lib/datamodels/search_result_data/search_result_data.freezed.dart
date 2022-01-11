// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_result_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchResultData _$SearchResultDataFromJson(Map<String, dynamic> json) {
  return _SearchResultData.fromJson(json);
}

/// @nodoc
class _$SearchResultDataTearOff {
  const _$SearchResultDataTearOff();

  _SearchResultData call(
      {required String start,
      required String destination,
      required String date,
      required String time,
      required String price,
      required String id,
      required String name,
      required int avail}) {
    return _SearchResultData(
      start: start,
      destination: destination,
      date: date,
      time: time,
      price: price,
      id: id,
      name: name,
      avail: avail,
    );
  }

  SearchResultData fromJson(Map<String, Object?> json) {
    return SearchResultData.fromJson(json);
  }
}

/// @nodoc
const $SearchResultData = _$SearchResultDataTearOff();

/// @nodoc
mixin _$SearchResultData {
  String get start => throw _privateConstructorUsedError;
  String get destination => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get avail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchResultDataCopyWith<SearchResultData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchResultDataCopyWith<$Res> {
  factory $SearchResultDataCopyWith(
          SearchResultData value, $Res Function(SearchResultData) then) =
      _$SearchResultDataCopyWithImpl<$Res>;
  $Res call(
      {String start,
      String destination,
      String date,
      String time,
      String price,
      String id,
      String name,
      int avail});
}

/// @nodoc
class _$SearchResultDataCopyWithImpl<$Res>
    implements $SearchResultDataCopyWith<$Res> {
  _$SearchResultDataCopyWithImpl(this._value, this._then);

  final SearchResultData _value;
  // ignore: unused_field
  final $Res Function(SearchResultData) _then;

  @override
  $Res call({
    Object? start = freezed,
    Object? destination = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? price = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? avail = freezed,
  }) {
    return _then(_value.copyWith(
      start: start == freezed
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String,
      destination: destination == freezed
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avail: avail == freezed
          ? _value.avail
          : avail // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$SearchResultDataCopyWith<$Res>
    implements $SearchResultDataCopyWith<$Res> {
  factory _$SearchResultDataCopyWith(
          _SearchResultData value, $Res Function(_SearchResultData) then) =
      __$SearchResultDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {String start,
      String destination,
      String date,
      String time,
      String price,
      String id,
      String name,
      int avail});
}

/// @nodoc
class __$SearchResultDataCopyWithImpl<$Res>
    extends _$SearchResultDataCopyWithImpl<$Res>
    implements _$SearchResultDataCopyWith<$Res> {
  __$SearchResultDataCopyWithImpl(
      _SearchResultData _value, $Res Function(_SearchResultData) _then)
      : super(_value, (v) => _then(v as _SearchResultData));

  @override
  _SearchResultData get _value => super._value as _SearchResultData;

  @override
  $Res call({
    Object? start = freezed,
    Object? destination = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? price = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? avail = freezed,
  }) {
    return _then(_SearchResultData(
      start: start == freezed
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String,
      destination: destination == freezed
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avail: avail == freezed
          ? _value.avail
          : avail // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SearchResultData implements _SearchResultData {
  const _$_SearchResultData(
      {required this.start,
      required this.destination,
      required this.date,
      required this.time,
      required this.price,
      required this.id,
      required this.name,
      required this.avail});

  factory _$_SearchResultData.fromJson(Map<String, dynamic> json) =>
      _$$_SearchResultDataFromJson(json);

  @override
  final String start;
  @override
  final String destination;
  @override
  final String date;
  @override
  final String time;
  @override
  final String price;
  @override
  final String id;
  @override
  final String name;
  @override
  final int avail;

  @override
  String toString() {
    return 'SearchResultData(start: $start, destination: $destination, date: $date, time: $time, price: $price, id: $id, name: $name, avail: $avail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchResultData &&
            const DeepCollectionEquality().equals(other.start, start) &&
            const DeepCollectionEquality()
                .equals(other.destination, destination) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.time, time) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.avail, avail));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(start),
      const DeepCollectionEquality().hash(destination),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(time),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(avail));

  @JsonKey(ignore: true)
  @override
  _$SearchResultDataCopyWith<_SearchResultData> get copyWith =>
      __$SearchResultDataCopyWithImpl<_SearchResultData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SearchResultDataToJson(this);
  }
}

abstract class _SearchResultData implements SearchResultData {
  const factory _SearchResultData(
      {required String start,
      required String destination,
      required String date,
      required String time,
      required String price,
      required String id,
      required String name,
      required int avail}) = _$_SearchResultData;

  factory _SearchResultData.fromJson(Map<String, dynamic> json) =
      _$_SearchResultData.fromJson;

  @override
  String get start;
  @override
  String get destination;
  @override
  String get date;
  @override
  String get time;
  @override
  String get price;
  @override
  String get id;
  @override
  String get name;
  @override
  int get avail;
  @override
  @JsonKey(ignore: true)
  _$SearchResultDataCopyWith<_SearchResultData> get copyWith =>
      throw _privateConstructorUsedError;
}
