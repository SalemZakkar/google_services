import 'package:google_services/core/data/model/circle_model/circle_model.dart';
import 'package:google_services/core/data/model/rectangle_model/rectangle_model.dart';
import 'package:google_services/core/domain/params/location_bias_params.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location_bias_params_model.g.dart';


@JsonSerializable(createToJson: true, createFactory: false)
class LocationBiasParamsModel {
  final CircleModel? circle;
  final RectangleModel? rectangle;

  LocationBiasParamsModel({this.circle, this.rectangle});

  Map<String, dynamic> toJson() => _$LocationBiasParamsModelToJson(this);
}

extension MapFromDomain on LocationBiasParams {
  LocationBiasParamsModel fromDomain() => LocationBiasParamsModel(
    circle: circle?.fromDomain(),
    rectangle: rectangle?.fromDomain(),
  );
}
