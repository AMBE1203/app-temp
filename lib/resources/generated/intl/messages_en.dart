// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(x) => "${x} is invalid format.";

  static String m1(x, y) => "${x}-${y} characters allowed.";

  static String m2(x, y) =>
      "Passwords must be ${x}-${y} characters with a mix of letters, numbers & symbols and can’t be start or end with a blank space.";

  static String m3(x) => "${x} characters allowed.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "badCertificateException":
            MessageLookupByLibrary.simpleMessage("badCertificateException"),
        "canNotConnectToHost": MessageLookupByLibrary.simpleMessage(
            "Can not connect to this host"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "cancellationException":
            MessageLookupByLibrary.simpleMessage("cancellationException"),
        "close": MessageLookupByLibrary.simpleMessage("Close"),
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("Confirm password"),
        "darkTheme": MessageLookupByLibrary.simpleMessage("Dark Theme"),
        "dateOfBirth": MessageLookupByLibrary.simpleMessage("Date of birth"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "emailAlreadyExists":
            MessageLookupByLibrary.simpleMessage("Email already exists."),
        "emptyEmail":
            MessageLookupByLibrary.simpleMessage("Email is not empty."),
        "female": MessageLookupByLibrary.simpleMessage("Female"),
        "firstName": MessageLookupByLibrary.simpleMessage("First name"),
        "gender": MessageLookupByLibrary.simpleMessage("Gender"),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "invalid": m0,
        "invalidDateTime":
            MessageLookupByLibrary.simpleMessage("Invalid Datetime"),
        "invalidEmail": MessageLookupByLibrary.simpleMessage("Invalid Email."),
        "invalidFormat": MessageLookupByLibrary.simpleMessage(
            "Invalid format. Please re-enter the field."),
        "invalidPassword":
            MessageLookupByLibrary.simpleMessage("Invalid Password."),
        "invalidPhoneNumber":
            MessageLookupByLibrary.simpleMessage("Invalid Phonenumber"),
        "invalidUserName":
            MessageLookupByLibrary.simpleMessage("Invalid Username"),
        "japanese": MessageLookupByLibrary.simpleMessage("Japanese"),
        "lastName": MessageLookupByLibrary.simpleMessage("Last name"),
        "lengthCharacter": m1,
        "lengthPassword": m2,
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "male": MessageLookupByLibrary.simpleMessage("Male"),
        "maxLength": m3,
        "noInternetException":
            MessageLookupByLibrary.simpleMessage("No internet."),
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "other": MessageLookupByLibrary.simpleMessage("Other"),
        "parseException":
            MessageLookupByLibrary.simpleMessage("parseException"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordDoesNotMatch":
            MessageLookupByLibrary.simpleMessage("Password does not match."),
        "passwordsAreNotMatch":
            MessageLookupByLibrary.simpleMessage("Passwords Are not match."),
        "phone": MessageLookupByLibrary.simpleMessage("Phone"),
        "required":
            MessageLookupByLibrary.simpleMessage("This field is required."),
        "retry": MessageLookupByLibrary.simpleMessage("Retry"),
        "search": MessageLookupByLibrary.simpleMessage("Search"),
        "setting": MessageLookupByLibrary.simpleMessage("Setting"),
        "signUp": MessageLookupByLibrary.simpleMessage("Sign up"),
        "somethingWentWrongPleaseTryAgainLater":
            MessageLookupByLibrary.simpleMessage(
                "Something went wrong, please try again later."),
        "thisFieldMustBeNumber": MessageLookupByLibrary.simpleMessage(
            "Invalid format. This field must be number."),
        "timeoutException":
            MessageLookupByLibrary.simpleMessage("timeoutException"),
        "tokenExpired": MessageLookupByLibrary.simpleMessage("Token expired."),
        "unknownException":
            MessageLookupByLibrary.simpleMessage("unknownException"),
        "wrongPassword":
            MessageLookupByLibrary.simpleMessage("Wrong password."),
        "youMustAcceptTerms": MessageLookupByLibrary.simpleMessage(
            "You must accept terms and conditions to continue")
      };
}
