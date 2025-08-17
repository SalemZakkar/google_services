import 'package:dartz/dartz.dart';
import 'package:google_services/core/domain/entity/failures.dart';
import 'package:google_services/places/domain/entity/place_details_result.dart';
import 'package:google_services/places/domain/repository/places_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class PlacesDetailsUseCase {
  PlacesRepository repository;
  PlacesDetailsUseCase(this.repository);

  Future<Either<Failure, PlaceDetailsResult>> call({
    required String params,
  }) {
    return repository.getPlaceDetails(placeId: params);
  }
}
