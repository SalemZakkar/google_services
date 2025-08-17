import 'package:google_services/core/domain/entity/lat_lng.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lat_lng_model.g.dart';


@JsonSerializable(createToJson: true)
class LatLngModel {
  final double latitude;
  final double longitude;

  LatLngModel({required this.latitude, required this.longitude});

  factory LatLngModel.fromJson(Map<String, dynamic> json) =>
      _$LatLngModelFromJson(json);

  Map<String, dynamic> toJson() => _$LatLngModelToJson(this);
}

extension MapToDomain on LatLngModel {
  LatLng toDomain() => LatLng(latitude: latitude, longitude: longitude);
}

extension MapFromDomain on LatLng {
  LatLngModel fromDomain() =>
      LatLngModel(latitude: latitude, longitude: longitude);
}
