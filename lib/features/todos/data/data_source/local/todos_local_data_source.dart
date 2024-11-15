import 'package:injectable/injectable.dart';

import '../../../../../core/utils/shared_pref.dart';
import '../../../../authentication/data/entities/user_info/user_info_model.dart';

@lazySingleton
class TodosLocalDataSource{
  TodosLocalDataSource(this.localClient);

  final SharedPreferencesStorage localClient;

  UserInfoModel get userInfo => localClient.userInfo;

}