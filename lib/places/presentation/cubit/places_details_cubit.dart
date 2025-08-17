import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_services/core/presentation/cubit/base_state.dart';
import 'package:google_services/injection.dart';
import 'package:google_services/places/domain/entity/place_details_result.dart';
import 'package:google_services/places/domain/usecase/places_details_use_case.dart';

class PlacesDetailsCubit
    extends Cubit<GoogleServicesBaseState<PlaceDetailsResult>> {
  PlacesDetailsCubit() : super(GoogleServicesBaseState());
  final useCase = getIt<PlacesDetailsUseCase>();

  void get({required String params}) async {
    emit(state.setInProgressState());
    var res = await useCase.call(params: params);
    res.fold(
      (e) => emit(state.setFailureState(e)),
      (r) => emit(state.setSuccessState(r)),
    );
  }
}
