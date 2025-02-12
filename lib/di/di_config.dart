
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'di_config.config.dart';

GetIt getIt = GetIt.instance;

@injectableInit
configureDependencies() => getIt.init();