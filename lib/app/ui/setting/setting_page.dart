import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../resources/resources.dart';
import '../../../shared/shared.dart';
import '../../app.dart';

@RoutePage()
class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _appProvider = ref.watch(appProvider);

    return CommonScaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SwitchListTile.adaptive(
              title: Text(S.current.darkTheme, style: AppTextStyles.h14),
              value: _appProvider.value?.isDarkMode ?? false,
              onChanged: (val) => ref.read(appProvider.notifier).setDarkMode(val),
              secondary: const Icon(Icons.lightbulb_outline),
            ),
            SwitchListTile.adaptive(
              title: Text(S.current.japanese, style: AppTextStyles.h14),
              value: _appProvider.value?.languageCode == LocaleConstants.ja,
              onChanged: (val) => ref.read(appProvider.notifier).setLanguage(val ? LocaleConstants.ja : LocaleConstants.en),
              secondary: const Icon(Icons.language_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
