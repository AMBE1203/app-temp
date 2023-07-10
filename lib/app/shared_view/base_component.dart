import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app.dart';

class BaseComponent extends HookConsumerWidget {
  const BaseComponent({required this.field, super.key});

  final FieldType field;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}
