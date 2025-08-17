import 'package:google_services/core/domain/params/location_bias_params.dart';

class PlacesAutocompleteParams {
  final String input;
  final LocationBiasParams? locationBias;

  PlacesAutocompleteParams({required this.input, this.locationBias});
}
