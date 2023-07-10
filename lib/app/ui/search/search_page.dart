import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../resources/resources.dart';
import '../../app.dart';

@RoutePage()
class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CommonScaffold(
      body: Center(
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.current.primaryColor),
          ),
          onPressed: () {
            // navigator.push(const AppRouteInfo.login());
          },
          child: Text(
            S.current.login,
            style: AppTextStyles.h14,
          ),
        ),
      ),
    );
  }
}
