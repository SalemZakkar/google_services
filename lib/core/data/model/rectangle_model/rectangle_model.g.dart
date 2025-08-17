// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rectangle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RectangleModel _$RectangleModelFromJson(Map<String, dynamic> json) =>
    RectangleModel(
      LatLngModel.fromJson(json['high'] as Map<String, dynamic>),
      LatLngModel.fromJson(json['low'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RectangleModelToJson(RectangleModel instance) =>
    <String, dynamic>{'low': instance.low, 'high': instance.high};
