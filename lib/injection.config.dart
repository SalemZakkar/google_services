// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_services/injectable_module.dart' as _i931;
import 'package:google_services/places/data/repository/places_repository_impl.dart'
    as _i157;
import 'package:google_services/places/data/source/places_remote_source/places_remote_source.dart'
    as _i107;
import 'package:google_services/places/domain/repository/places_repository.dart'
    as _i554;
import 'package:google_services/places/domain/usecase/places_autocomplete_use_case.dart'
    as _i291;
import 'package:google_services/places/domain/usecase/places_details_use_case.dart'
    as _i239;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final injectableModule = _$InjectableModule();
    gh.lazySingleton<_i361.Dio>(() => injectableModule.dioInstance);
    gh.lazySingleton<_i974.Logger>(() => injectableModule.logger);
    gh.factory<_i107.PlacesRemoteSource>(
      () => _i107.PlaceRemoteSourceImpl(gh<_i361.Dio>()),
    );
    gh.factory<_i554.PlacesRepository>(
      () => _i157.PlacesRepositoryImpl(gh<_i107.PlacesRemoteSource>()),
    );
    gh.factory<_i291.PlacesAutocompleteUseCase>(
      () => _i291.PlacesAutocompleteUseCase(gh<_i554.PlacesRepository>()),
    );
    gh.factory<_i239.PlacesDetailsUseCase>(
      () => _i239.PlacesDetailsUseCase(gh<_i554.PlacesRepository>()),
    );
    return this;
  }
}

class _$InjectableModule extends _i931.InjectableModule {}
