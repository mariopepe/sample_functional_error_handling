// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:meetup_app/app/todo_bloc.dart' as _i5;
import 'package:meetup_app/domain/home/i_todo_repo.dart' as _i3;
import 'package:meetup_app/infrastructure/home/todo_repo.dart' as _i4;

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
    gh.lazySingleton<_i3.ITodoRepo>(() => _i4.TodoRepo());
    gh.factory<_i5.TodoBloc>(() => _i5.TodoBloc(gh<_i3.ITodoRepo>()));
    return this;
  }
}
