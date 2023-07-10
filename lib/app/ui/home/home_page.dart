import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/shared.dart';
import '../../app.dart';

@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Log.d('HomePage > build');

    return CommonScaffold(
      body: RefreshIndicator(
        onRefresh: () {
          final completer = Completer<void>();
          return completer.future;
        },
        child: const Column(
          children: [
            Text(
              'Home',
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
