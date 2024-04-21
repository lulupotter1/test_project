// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/auth/data/datasources/local/transaction_local_source.dart'
    as _i5;
import '../../features/auth/data/repositories/transaction_repository_impl.dart'
    as _i7;
import '../../features/auth/domain/repositories/transaction_repository.dart'
    as _i6;
import '../../features/auth/domain/usecases/get_transcation.dart' as _i8;
import '../../features/auth/presentation/auth/auth_bloc/auth_bloc.dart' as _i3;
import '../../features/auth/presentation/main_screen/blocs/profile_bloc/profile_bloc.dart'
    as _i4;
import '../../features/auth/presentation/main_screen/blocs/transaction_bloc/transaction_bloc.dart'
    as _i9;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.AuthBloc>(() => _i3.AuthBloc());
    gh.factory<_i4.ProfileBloc>(() => _i4.ProfileBloc());
    gh.factory<_i5.TransactionLocalSource>(
        () => _i5.TransactionLocalSourceIml());
    gh.factory<_i6.TransactionRepository>(
        () => _i7.TransactionRepositoryImpl(gh<_i5.TransactionLocalSource>()));
    gh.factory<_i8.GetTransactionUseCase>(
        () => _i8.GetTransactionUseCase(gh<_i6.TransactionRepository>()));
    gh.factory<_i9.TransactionBloc>(
        () => _i9.TransactionBloc(gh<_i8.GetTransactionUseCase>()));
    return this;
  }
}
