import 'package:freezed_annotation/freezed_annotation.dart';
part 'livestream.freezed.dart';
part 'livestream.g.dart';

@Freezed()
class Livestream with _$Livestream {
  const factory Livestream({
    required double customerLatitude,
    required double customerLongitude,
    required double driverLatitude,
    required double driverLongitude,
  }) = _Livestream;

  factory Livestream.fromJson(Map<String, dynamic> json) =>
      _$LivestreamFromJson(json);
}
