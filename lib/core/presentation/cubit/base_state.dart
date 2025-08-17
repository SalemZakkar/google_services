
import 'package:google_services/core/domain/entity/failures.dart';

enum GoogleServicesBaseStatus {
  initial,
  inProgress,
  success,
  failure,
}

class GoogleServicesBaseState<T> {
  final GoogleServicesBaseStatus status;
  final T? item;
  final Failure? failure;

  GoogleServicesBaseState<T> setInitialState() => GoogleServicesBaseState<T>(
        status: GoogleServicesBaseStatus.initial,
      );

  GoogleServicesBaseState<T> setInProgressState() => GoogleServicesBaseState<T>(
        status: GoogleServicesBaseStatus.inProgress,
      );

  GoogleServicesBaseState<T> setSuccessState(T item) =>
      GoogleServicesBaseState<T>(status: GoogleServicesBaseStatus.success, item: item);

  GoogleServicesBaseState<T> setFailureState(Failure failure) =>
      GoogleServicesBaseState<T>(status: GoogleServicesBaseStatus.failure, failure: failure);

  bool get isInProgress => status == GoogleServicesBaseStatus.inProgress;

  bool get isFailure => status == GoogleServicesBaseStatus.failure;

  bool get isSuccess => status == GoogleServicesBaseStatus.success;

  const GoogleServicesBaseState({
    this.status = GoogleServicesBaseStatus.initial,
    this.item,
    this.failure,
  });

  GoogleServicesBaseState<T> copyWith({
    GoogleServicesBaseStatus? status,
    T? item,
    Failure? failure,
  }) {
    return GoogleServicesBaseState<T>(
      status: status ?? this.status,
      item: item ?? this.item,
      failure: failure ?? this.failure,
    );
  }
}
