import 'package:google_services/core/data/model/lat_lng_model/lat_lng_model.dart';
import 'package:google_services/core/domain/entity/circle.dart';
import 'package:json_annotation/json_annotation.dart';

part 'circle_model.g.dart';

@JsonSerializable(createToJson: true)
class CircleModel {
  LatLngModel center;
  double? radius;

  CircleModel({required this.center, this.radius});

  factory CircleModel.fromJson(Map<String, dynamic> json) =>
      _$CircleModelFromJson(json);

  Map<String, dynamic> toJson() => _$CircleModelToJson(this);
}

extension MapToDomain on CircleModel {
  Circle toDomain() => Circle(center: center.toDomain(), radius: radius);
}

extension MapFromDomain on Circle {
  CircleModel fromDomain() =>
      CircleModel(center: center.fromDomain(), radius: radius);
}
