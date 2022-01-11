import 'package:freezed_annotation/freezed_annotation.dart';
part 'search_result_data.freezed.dart';
part 'search_result_data.g.dart';

@Freezed()
class SearchResultData with _$SearchResultData {
  const factory SearchResultData({
    required String start,
    required String destination,
    required String date,
    required String time,
    required String price,
  }) = _SearchResultData;

  factory SearchResultData.fromJson(Map<String, dynamic> json) =>
      _$SearchResultDataFromJson(json);
}
