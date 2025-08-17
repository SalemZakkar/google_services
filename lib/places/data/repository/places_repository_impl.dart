import 'package:dartz/dartz.dart';
import 'package:google_services/core/data/utils/api_handler.dart';
import 'package:google_services/core/domain/entity/failures.dart';
import 'package:google_services/places/data/model/places_autocomplete_params_model/place_autocomplete_params_model.dart';
import 'package:google_services/places/data/model/places_details_result_model/places_details_result_model.dart';
import 'package:google_services/places/data/source/places_remote_source/places_remote_source.dart';
import 'package:google_services/places/domain/entity/place_autocomplete_result.dart';
import 'package:google_services/places/domain/entity/place_details_result.dart';
import 'package:google_services/places/domain/params/places_autocomplete_params.dart';
import 'package:google_services/places/domain/repository/places_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PlacesRepository)
class PlacesRepositoryImpl extends PlacesRepository with ApiHandler {
  final PlacesRemoteSource source;

  PlacesRepositoryImpl(this.source);

  @override
  Future<Either<Failure, List<PlaceAutocompleteResult>>> autocomplete({
    required PlacesAutocompleteParams params,
  }) {
    return request(() async {
      if (params.input.trim().isEmpty) {
        return Right([]);
      }
      var res = await source.autoComplete(params: params.fromDomain());
      if (res == {}) {
        return Right([]);
      }
      List<PlaceAutocompleteResult> list = [];
      List raw = res['suggestions'] ?? [];
      for (var e in raw) {
        if (e['placePrediction']?['text']?['text'] != null &&
            e['placePrediction']?['placeId'] != null) {
          list.add(
            PlaceAutocompleteResult(
              name: e['placePrediction']!['text']!['text']!.toString(),
              id: e['placePrediction']!['placeId']!.toString(),
            ),
          );
        }
      }
      return right(list);
    });
  }

  @override
  Future<Either<Failure, PlaceDetailsResult>> getPlaceDetails({
    required String placeId,
  }) async {
    return request(() async {
      var res = await source.getPlaceDetails(placeId: placeId);
      if(res == null || res == {}){

      }
      PlaceDetailsResult placeResult = PlacesDetailsResultModel.fromJson(res).toDomain();
      return Right(placeResult);
    });
  }
}
