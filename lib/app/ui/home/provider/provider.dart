import 'dart:async';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../domain/domain.dart';
import '../../../../shared/shared.dart';

part 'provider.g.dart';

@riverpod
class UserList extends _$UserList {
  // static final _log = LoggerFactory.logger('UserList');

  @override
  Future<IList<User>> build({required String lampId}) {
    Log.d('UserList > build()');
    final result = [const User(id: '1', email: 'test')].toIList();
    return Future.value(result);
  }
}
