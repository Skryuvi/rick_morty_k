// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:rick_morty/data/local_source/local_source.dart' as _i149;
import 'package:rick_morty/data/remote_source/remote_source.dart' as _i648;
import 'package:rick_morty/data/repository/rick_morty_repository.dart' as _i57;
import 'package:rick_morty/provider/network_provider.dart' as _i199;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i199.NetworkProvider>(() => _i199.NetworkProvider());
    gh.singleton<_i149.LocalSource>(() => _i149.LocalSource());
    gh.singleton<_i648.RemoteSource>(
        () => _i648.RemoteSource(gh<_i199.NetworkProvider>()));
    gh.singleton<_i57.RickMortyRepository>(() => _i57.RickMortyRepositoryImpl(
          gh<_i648.RemoteSource>(),
          gh<_i149.LocalSource>(),
        ));
    return this;
  }
}
