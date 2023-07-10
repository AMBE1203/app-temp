import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app.dart';

// @RoutePage()
class ItemDetailPage extends ConsumerWidget {
  const ItemDetailPage({@pathParam required this.id, super.key});
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const CommonScaffold(
      body: Text('ItemDetailPage'),
    );
  }
}
