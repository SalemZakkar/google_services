import 'package:dartz/dartz.dart';
import 'package:google_services/core/domain/entity/failures.dart';
import 'package:google_services/places/domain/entity/place_autocomplete_result.dart';
import 'package:google_services/places/domain/entity/place_details_result.dart';
import 'package:google_services/places/domain/params/places_autocomplete_params.dart';

abstract class PlacesRepository {
  Future<Either<Failure, List<PlaceAutocompleteResult>>> autocomplete({
    required PlacesAutocompleteParams params,
  });

  Future<Either<Failure , PlaceDetailsResult>> getPlaceDetails({required String placeId});
}
