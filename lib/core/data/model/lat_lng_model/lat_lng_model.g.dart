// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lat_lng_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LatLngModel _$LatLngModelFromJson(Map<String, dynamic> json) => LatLngModel(
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
);

Map<String, dynamic> _$LatLngModelToJson(LatLngModel instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
