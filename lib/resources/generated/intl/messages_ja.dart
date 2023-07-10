// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ja locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ja';

  static String m0(x) => "${x}は無効な形式です。";

  static String m1(x, y) => "${x}-${y}の文字が使用できます。";

  static String m2(x, y) =>
      "パスワードは文字、数字、記号を組み合わせて${x}-${y}文字で設定してください。先頭や末尾にスペースを使用することはできません。";

  static String m3(x) => "${x}文字まで使用できます。";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "badCertificateException":
            MessageLookupByLibrary.simpleMessage("badCertificateException"),
        "canNotConnectToHost": MessageLookupByLibrary.simpleMessage(
            "Can not connect to this host"),
        "cancel": MessageLookupByLibrary.simpleMessage("キャンセル"),
        "cancellationException":
            MessageLookupByLibrary.simpleMessage("cancellationException"),
        "close": MessageLookupByLibrary.simpleMessage("近い"),
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("Confirm password"),
        "darkTheme": MessageLookupByLibrary.simpleMessage("暗いテーマ"),
        "dateOfBirth": MessageLookupByLibrary.simpleMessage("Date of birth"),
        "email": MessageLookupByLibrary.simpleMessage("メールアドレス"),
        "emailAlreadyExists":
            MessageLookupByLibrary.simpleMessage("Email already exists."),
        "emptyEmail":
            MessageLookupByLibrary.simpleMessage("Email is not empty."),
        "female": MessageLookupByLibrary.simpleMessage("女性"),
        "firstName": MessageLookupByLibrary.simpleMessage("First name"),
        "gender": MessageLookupByLibrary.simpleMessage("性別"),
        "home": MessageLookupByLibrary.simpleMessage("ホームページ"),
        "invalid": m0,
        "invalidDateTime":
            MessageLookupByLibrary.simpleMessage("Invalid Datetime"),
        "invalidEmail": MessageLookupByLibrary.simpleMessage("Invalid Email."),
        "invalidFormat":
            MessageLookupByLibrary.simpleMessage("無効な形式です。再度ご入力ください。"),
        "invalidPassword":
            MessageLookupByLibrary.simpleMessage("Invalid Password."),
        "invalidPhoneNumber":
            MessageLookupByLibrary.simpleMessage("Invalid Phonenumber"),
        "invalidUserName":
            MessageLookupByLibrary.simpleMessage("Invalid Username"),
        "japanese": MessageLookupByLibrary.simpleMessage("日本語"),
        "lastName": MessageLookupByLibrary.simpleMessage("Last name"),
        "lengthCharacter": m1,
        "lengthPassword": m2,
        "login": MessageLookupByLibrary.simpleMessage("ログイン"),
        "male": MessageLookupByLibrary.simpleMessage("男性"),
        "maxLength": m3,
        "noInternetException":
            MessageLookupByLibrary.simpleMessage("No internet."),
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "other": MessageLookupByLibrary.simpleMessage("その他"),
        "parseException":
            MessageLookupByLibrary.simpleMessage("parseException"),
        "password": MessageLookupByLibrary.simpleMessage("パスワード"),
        "passwordDoesNotMatch":
            MessageLookupByLibrary.simpleMessage("パスワードが一致しません。"),
        "passwordsAreNotMatch":
            MessageLookupByLibrary.simpleMessage("Passwords Are not match."),
        "phone": MessageLookupByLibrary.simpleMessage("Phone"),
        "required": MessageLookupByLibrary.simpleMessage("入力が必須の項目です。"),
        "retry": MessageLookupByLibrary.simpleMessage("リトライ"),
        "search": MessageLookupByLibrary.simpleMessage("探す"),
        "setting": MessageLookupByLibrary.simpleMessage("設定"),
        "signUp": MessageLookupByLibrary.simpleMessage("Sign up"),
        "somethingWentWrongPleaseTryAgainLater":
            MessageLookupByLibrary.simpleMessage(
                "Something went wrong, please try again later."),
        "thisFieldMustBeNumber":
            MessageLookupByLibrary.simpleMessage("無効な形式です。数字をご入力ください。"),
        "timeoutException":
            MessageLookupByLibrary.simpleMessage("timeoutException"),
        "tokenExpired": MessageLookupByLibrary.simpleMessage("Token expired."),
        "unknownException":
            MessageLookupByLibrary.simpleMessage("unknownException"),
        "wrongPassword":
            MessageLookupByLibrary.simpleMessage("パスワードが正しくありません。"),
        "youMustAcceptTerms": MessageLookupByLibrary.simpleMessage(
            "You must accept terms and conditions to continue")
      };
}
