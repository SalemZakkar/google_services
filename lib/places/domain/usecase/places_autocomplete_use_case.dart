import 'package:dartz/dartz.dart';
import 'package:google_services/core/domain/entity/failures.dart';
import 'package:google_services/places/domain/entity/place_autocomplete_result.dart';
import 'package:google_services/places/domain/params/places_autocomplete_params.dart';
import 'package:google_services/places/domain/repository/places_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class PlacesAutocompleteUseCase {
  PlacesRepository repository;
  PlacesAutocompleteUseCase(this.repository);

  Future<Either<Failure, List<PlaceAutocompleteResult>>> call({
    required PlacesAutocompleteParams params,
  }) {
    return repository.autocomplete(params: params);
  }
}
