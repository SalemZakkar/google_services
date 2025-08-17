import 'package:google_services/core/data/model/lat_lng_model/lat_lng_model.dart';
import 'package:google_services/places/domain/entity/place_details_result.dart';

class PlacesDetailsResultModel {
  final String? placeId;
  final String? name;
  final LatLngModel? position;
  final String? country, city, postalCode, province;

  PlacesDetailsResultModel({
    required this.name,
    required this.placeId,
    this.position,
    this.country,
    this.city,
    this.postalCode,
    this.province,
  });

  factory PlacesDetailsResultModel.fromJson(Map<String, dynamic> json) {
    String? country;
    String? city;
    String? province;
    String? postalCode;
    for (final component in json['addressComponents'] ?? []) {
      final types = List<String>.from(component['types']);
      if (types.contains('country')) {
        country = component['longText'];
      } else if (types.contains('locality')) {
        city = component['longText'];
      } else if (types.contains('administrative_area_level_1')) {
        province = component['longText'];
      } else if (types.contains('postal_code')) {
        postalCode = component['longText'];
      }
    }
    return PlacesDetailsResultModel(
      name: json['formattedAddress'],
      placeId: json['placeId'],
      position:
          json['location'] != null
              ? LatLngModel.fromJson(json['location'])
              : null,
      country: country,
      city: city,
      postalCode: postalCode,
      province: province,
    );
  }
}

extension MapToDomain on PlacesDetailsResultModel {
  PlaceDetailsResult toDomain() => PlaceDetailsResult(
    name: name,
    placeId: placeId,
    province: province,
    postalCode: postalCode,
    position: position?.toDomain(),
    city: city,
    country: country,
  );
}
