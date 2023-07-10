// ignore_for_file: avoid_print
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/shared.dart';

class RiverpodLogger extends ProviderObserver {
  @override
  void didUpdateProvider(ProviderBase<dynamic> provider, Object? previousValue, Object? newValue, ProviderContainer container) {
    Log.d('didUpdateProvider → ${provider.name ?? provider.runtimeType},  "newValue": "$newValue"');
  }

  @override
  void didDisposeProvider(ProviderBase<dynamic> provider, ProviderContainer container) {
    Log.d('didDisposeProvider → ${provider.name ?? provider.runtimeType}');
  }

  @override
  void didAddProvider(ProviderBase<dynamic> provider, Object? value, ProviderContainer container) {
    Log.d('didAddProvider → ${provider.name ?? provider.runtimeType}');
  }
}
