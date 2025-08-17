import 'package:google_services/core/domain/entity/lat_lng.dart';

class PlaceDetailsResult {
  final String? placeId;
  final String? name;
  final LatLng? position;
  final String? country, city, postalCode, province;

  PlaceDetailsResult({
    this.name,
    this.placeId,
    this.position,
    this.country,
    this.city,
    this.postalCode,
    this.province,
  });
}
