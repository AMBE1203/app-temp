import 'package:get_it/get_it.dart';

import '../shared.dart';

class SharedConfig extends Config {
  SharedConfig._();

  factory SharedConfig.getInstance() {
    return _instance;
  }

  static final SharedConfig _instance = SharedConfig._();

  @override
  Future<void> config() async {
    Log.d('Shared > config');
    await GetIt.instance.get<AppInfo>().init();
  }
}
