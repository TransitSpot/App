import 'package:freezed_annotation/freezed_annotation.dart';
part 'location_lat_lng.freezed.dart';
part 'location_lat_lng.g.dart';

@Freezed()
class LocationLatLng with _$LocationLatLng {
  const factory LocationLatLng({
    required double latitude,
    required double longitude,
  }) = _LocationLatLng;

  factory LocationLatLng.fromJson(Map<String, dynamic> json) =>
      _$LocationLatLngFromJson(json);
}
