import 'package:google_services/core/domain/entity/lat_lng.dart';

class Circle {
  double? radius;
  LatLng center;

  Circle({this.radius, required this.center});
}
