// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchResultData _$$_SearchResultDataFromJson(Map<String, dynamic> json) =>
    _$_SearchResultData(
      start: json['start'] as String,
      destination: json['destination'] as String,
      date: json['date'] as String,
      time: json['time'] as String,
      price: json['price'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      avail: json['avail'] as int,
    );

Map<String, dynamic> _$$_SearchResultDataToJson(_$_SearchResultData instance) =>
    <String, dynamic>{
      'start': instance.start,
      'destination': instance.destination,
      'date': instance.date,
      'time': instance.time,
      'price': instance.price,
      'id': instance.id,
      'name': instance.name,
      'avail': instance.avail,
    };
