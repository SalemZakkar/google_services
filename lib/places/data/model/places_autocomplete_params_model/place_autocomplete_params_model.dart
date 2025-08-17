import 'package:google_services/core/data/model/location_bias_params_model/location_bias_params_model.dart';
import 'package:google_services/places/domain/params/places_autocomplete_params.dart';
import 'package:json_annotation/json_annotation.dart';

part 'place_autocomplete_params_model.g.dart';

@JsonSerializable(createToJson: true, createFactory: false)
class PlaceAutocompleteParamsModel {
  final String input;
  final LocationBiasParamsModel? locationBias;

  PlaceAutocompleteParamsModel({required this.input, this.locationBias});

  Map<String, dynamic> toJson() => _$PlaceAutocompleteParamsModelToJson(this);
}

extension MapFromDomain on PlacesAutocompleteParams {
  PlaceAutocompleteParamsModel fromDomain() => PlaceAutocompleteParamsModel(
    input: input,
    locationBias: locationBias?.fromDomain(),
  );
}
