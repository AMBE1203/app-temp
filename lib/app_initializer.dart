import 'app/app.dart';
import 'data/data.dart';
import 'domain/domain.dart';
import 'shared/shared.dart';

class AppInitializer {
  static Future<void> init() async {
    EnvConstants.init();
    await AppConfig.getInstance().init();
    await SharedConfig.getInstance().init();
    await DomainConfig.getInstance().init();
    await DataConfig.getInstance().init();
  }
}
