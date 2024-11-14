import 'package:injectable/injectable.dart';

import '../../../../../core/utils/shared_pref.dart';

@lazySingleton
class TodosLocalDataSource{
  TodosLocalDataSource(this.localClient);

  final SharedPreferencesStorage localClient;

}