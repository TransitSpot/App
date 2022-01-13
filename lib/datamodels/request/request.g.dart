// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Request _$$_RequestFromJson(Map<String, dynamic> json) => _$_Request(
      customerName: json['customerName'] as String,
      customerLatitude: (json['customerLatitude'] as num).toDouble(),
      customerLongitude: (json['customerLongitude'] as num).toDouble(),
      destinationLatitude: (json['destinationLatitude'] as num).toDouble(),
      destinationLongitude: (json['destinationLongitude'] as num).toDouble(),
      isExpired: json['isExpired'] as bool,
      isAccepted: json['isAccepted'] as bool,
    );

Map<String, dynamic> _$$_RequestToJson(_$_Request instance) =>
    <String, dynamic>{
      'customerName': instance.customerName,
      'customerLatitude': instance.customerLatitude,
      'customerLongitude': instance.customerLongitude,
      'destinationLatitude': instance.destinationLatitude,
      'destinationLongitude': instance.destinationLongitude,
      'isExpired': instance.isExpired,
      'isAccepted': instance.isAccepted,
    };
