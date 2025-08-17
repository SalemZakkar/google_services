import 'package:google_services/core/data/model/lat_lng_model/lat_lng_model.dart';
import 'package:google_services/core/domain/entity/rectangle.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rectangle_model.g.dart';

@JsonSerializable(createToJson: true)
class RectangleModel {
  LatLngModel low, high;

  RectangleModel(this.high, this.low);

  factory RectangleModel.fromJson(Map<String, dynamic> json) =>
      _$RectangleModelFromJson(json);

  Map<String, dynamic> toJson() => _$RectangleModelToJson(this);
}

extension MapToDomain on RectangleModel {
  Rectangle toDomain() => Rectangle(low: low.toDomain(), high: high.toDomain());
}

extension MapFromDomain on Rectangle {
  RectangleModel fromDomain() =>
      RectangleModel(high.fromDomain(), low.fromDomain());
}
