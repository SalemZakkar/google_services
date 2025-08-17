import 'package:google_services/core/domain/entity/circle.dart';
import 'package:google_services/core/domain/entity/rectangle.dart';

class LocationBiasParams {
  final Circle? circle;
  final Rectangle? rectangle;

  LocationBiasParams({this.circle, this.rectangle}){
    assert(circle != null || rectangle != null, 'Either circle or rectangle must be provided and only one.');
  }
}