import 'package:freezed_annotation/freezed_annotation.dart';
part 'request.freezed.dart';
part 'request.g.dart';

@Freezed()
class Request with _$Request {
  const factory Request({
    required String customerName,
    required double customerLatitude,
    required double customerLongitude,
    required double destinationLatitude,
    required double destinationLongitude,
    required bool isExpired,
    required bool isAccepted,
  }) = _Request;

  factory Request.fromJson(Map<String, dynamic> json) =>
      _$RequestFromJson(json);
}
