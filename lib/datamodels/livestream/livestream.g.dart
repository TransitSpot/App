// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'livestream.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Livestream _$$_LivestreamFromJson(Map<String, dynamic> json) =>
    _$_Livestream(
      customerLatitude: (json['customerLatitude'] as num).toDouble(),
      customerLongitude: (json['customerLongitude'] as num).toDouble(),
      driverLatitude: (json['driverLatitude'] as num).toDouble(),
      driverLongitude: (json['driverLongitude'] as num).toDouble(),
    );

Map<String, dynamic> _$$_LivestreamToJson(_$_Livestream instance) =>
    <String, dynamic>{
      'customerLatitude': instance.customerLatitude,
      'customerLongitude': instance.customerLongitude,
      'driverLatitude': instance.driverLatitude,
      'driverLongitude': instance.driverLongitude,
    };
