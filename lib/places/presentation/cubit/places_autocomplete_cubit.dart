import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_services/core/presentation/cubit/base_state.dart';
import 'package:google_services/injection.dart';
import 'package:google_services/places/domain/entity/place_autocomplete_result.dart';
import 'package:google_services/places/domain/params/places_autocomplete_params.dart';
import 'package:google_services/places/domain/usecase/places_autocomplete_use_case.dart';

class PlacesAutocompleteCubit
    extends Cubit<GoogleServicesBaseState<List<PlaceAutocompleteResult>>> {
  PlacesAutocompleteCubit() : super(GoogleServicesBaseState());
  final useCase = getIt<PlacesAutocompleteUseCase>();

  void get({required PlacesAutocompleteParams params}) async {
    emit(state.setInProgressState());
    var res = await useCase.call(params: params);
    res.fold(
      (e) => emit(state.setFailureState(e)),
      (r) => emit(state.setSuccessState(r)),
    );
  }
}
