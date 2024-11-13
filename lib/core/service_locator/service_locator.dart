import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import '../service_locator/service_locator.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', 
  preferRelativeImports: true,
  asExtension: false,
)
Future<GetIt> initInjector() { 
  return $initGetIt(getIt);
}