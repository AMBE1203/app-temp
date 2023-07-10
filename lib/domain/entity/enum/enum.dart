import 'package:flutter/material.dart';

import '../../../resources/resources.dart';
import '../../../shared/shared.dart';

enum AppRoute {
  login,
  main,
}

enum Gender {
  male(ServerConstants.male),
  female(ServerConstants.female),
  other(ServerConstants.other),
  unknown(ServerConstants.unknown);

  const Gender(this.serverValue);
  final int serverValue;
}

// enum LanguageCode {
//   en(localeCode: LocaleConstants.en, serverValue: ServerConstants.en),
//   ja(localeCode: LocaleConstants.ja, serverValue: ServerConstants.ja);

//   const LanguageCode({
//     required this.localeCode,
//     required this.serverValue,
//   });
//   final String localeCode;
//   final String serverValue;

//   static LanguageCode get defaultValue => en;
// }

enum NotificationType {
  unknown,
  newPost,
  liked,
}

enum BottomTab {
  home(icon: Icon(Icons.home), activeIcon: Icon(Icons.home)),
  search(icon: Icon(Icons.search), activeIcon: Icon(Icons.search)),
  setting(icon: Icon(Icons.settings), activeIcon: Icon(Icons.settings));

  const BottomTab({
    required this.icon,
    required this.activeIcon,
  });
  final Icon icon;
  final Icon activeIcon;

  String get title {
    switch (this) {
      case BottomTab.home:
        return S.current.home;
      case BottomTab.search:
        return S.current.search;
      case BottomTab.setting:
        return S.current.setting;
    }
  }
}
