// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'circle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CircleModel _$CircleModelFromJson(Map<String, dynamic> json) => CircleModel(
  center: LatLngModel.fromJson(json['center'] as Map<String, dynamic>),
  radius: (json['radius'] as num?)?.toDouble(),
);

Map<String, dynamic> _$CircleModelToJson(CircleModel instance) =>
    <String, dynamic>{'center': instance.center, 'radius': instance.radius};
