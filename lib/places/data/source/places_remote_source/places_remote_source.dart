import 'package:dio/dio.dart';
import 'package:google_services/places/data/model/places_autocomplete_params_model/place_autocomplete_params_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'places_remote_source.g.dart';

abstract class PlacesRemoteSource {
  Future autoComplete({
    required PlaceAutocompleteParamsModel params,
  });

  Future getPlaceDetails({required String placeId});
}

@RestApi(baseUrl: 'https://places.googleapis.com/v1/')
@Injectable(as: PlacesRemoteSource)
abstract class PlaceRemoteSourceImpl implements PlacesRemoteSource {
  @factoryMethod
  factory PlaceRemoteSourceImpl(Dio dio) {
    return _PlaceRemoteSourceImpl(dio);
  }

  @DioResponseType(ResponseType.json)
  @POST('places:autocomplete')
  @override
  Future autoComplete({
    @Body() required PlaceAutocompleteParamsModel params,
  });

  @DioResponseType(ResponseType.json)
  @GET("places/{placeId}")
  @override
  Future getPlaceDetails({
    @Path() required String placeId,
  });
}
