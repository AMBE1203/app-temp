import 'package:flutter/material.dart';

import '../../shared/shared.dart';
import '../app.dart';

class CommonScaffold extends StatelessWidget {
  const CommonScaffold({
    required this.body,
    this.appBar,
    this.floatingActionButton,
    this.drawer,
    this.backgroundColor,
    this.hideKeyboardWhenTouchOutside = false,
    this.useSafeArea = true,
    super.key,
  });

  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final Widget? floatingActionButton;
  final Color? backgroundColor;
  final bool hideKeyboardWhenTouchOutside;
  final bool useSafeArea;

  @override
  Widget build(BuildContext context) {
    final safeArea = SafeArea(child: body);
    final scaffold = Scaffold(backgroundColor: backgroundColor, body: Shimmer(child: useSafeArea ? safeArea : body), appBar: appBar, drawer: drawer, floatingActionButton: floatingActionButton);
    return hideKeyboardWhenTouchOutside ? GestureDetector(onTap: () => ViewUtils.hideKeyboard(context), child: scaffold) : scaffold;
  }
}
