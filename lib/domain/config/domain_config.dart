import '../../shared/shared.dart';

class DomainConfig extends Config {
  factory DomainConfig.getInstance() {
    return _instance;
  }

  DomainConfig._();

  static final DomainConfig _instance = DomainConfig._();

  @override
  Future<void> config() async {
    Log.d('Domain > config');
  }
}
