// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `unknownException`
  String get unknownException {
    return Intl.message(
      'unknownException',
      name: 'unknownException',
      desc: '',
      args: [],
    );
  }

  /// `parseException`
  String get parseException {
    return Intl.message(
      'parseException',
      name: 'parseException',
      desc: '',
      args: [],
    );
  }

  /// `cancellationException`
  String get cancellationException {
    return Intl.message(
      'cancellationException',
      name: 'cancellationException',
      desc: '',
      args: [],
    );
  }

  /// `No internet.`
  String get noInternetException {
    return Intl.message(
      'No internet.',
      name: 'noInternetException',
      desc: '',
      args: [],
    );
  }

  /// `timeoutException`
  String get timeoutException {
    return Intl.message(
      'timeoutException',
      name: 'timeoutException',
      desc: '',
      args: [],
    );
  }

  /// `badCertificateException`
  String get badCertificateException {
    return Intl.message(
      'badCertificateException',
      name: 'badCertificateException',
      desc: '',
      args: [],
    );
  }

  /// `Can not connect to this host`
  String get canNotConnectToHost {
    return Intl.message(
      'Can not connect to this host',
      name: 'canNotConnectToHost',
      desc: '',
      args: [],
    );
  }

  /// `Token expired.`
  String get tokenExpired {
    return Intl.message(
      'Token expired.',
      name: 'tokenExpired',
      desc: '',
      args: [],
    );
  }

  /// `Email is not empty.`
  String get emptyEmail {
    return Intl.message(
      'Email is not empty.',
      name: 'emptyEmail',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Email.`
  String get invalidEmail {
    return Intl.message(
      'Invalid Email.',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Password.`
  String get invalidPassword {
    return Intl.message(
      'Invalid Password.',
      name: 'invalidPassword',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Username`
  String get invalidUserName {
    return Intl.message(
      'Invalid Username',
      name: 'invalidUserName',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Phonenumber`
  String get invalidPhoneNumber {
    return Intl.message(
      'Invalid Phonenumber',
      name: 'invalidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Datetime`
  String get invalidDateTime {
    return Intl.message(
      'Invalid Datetime',
      name: 'invalidDateTime',
      desc: '',
      args: [],
    );
  }

  /// `Passwords Are not match.`
  String get passwordsAreNotMatch {
    return Intl.message(
      'Passwords Are not match.',
      name: 'passwordsAreNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message(
      'Retry',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get setting {
    return Intl.message(
      'Setting',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get other {
    return Intl.message(
      'Other',
      name: 'other',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Dark Theme`
  String get darkTheme {
    return Intl.message(
      'Dark Theme',
      name: 'darkTheme',
      desc: '',
      args: [],
    );
  }

  /// `Japanese`
  String get japanese {
    return Intl.message(
      'Japanese',
      name: 'japanese',
      desc: '',
      args: [],
    );
  }

  /// `This field is required.`
  String get required {
    return Intl.message(
      'This field is required.',
      name: 'required',
      desc: '',
      args: [],
    );
  }

  /// `{x} is invalid format.`
  String invalid(Object x) {
    return Intl.message(
      '$x is invalid format.',
      name: 'invalid',
      desc: '',
      args: [x],
    );
  }

  /// `{x}-{y} characters allowed.`
  String lengthCharacter(Object x, Object y) {
    return Intl.message(
      '$x-$y characters allowed.',
      name: 'lengthCharacter',
      desc: '',
      args: [x, y],
    );
  }

  /// `Passwords must be {x}-{y} characters with a mix of letters, numbers & symbols and can’t be start or end with a blank space.`
  String lengthPassword(Object x, Object y) {
    return Intl.message(
      'Passwords must be $x-$y characters with a mix of letters, numbers & symbols and can’t be start or end with a blank space.',
      name: 'lengthPassword',
      desc: '',
      args: [x, y],
    );
  }

  /// `{x} characters allowed.`
  String maxLength(Object x) {
    return Intl.message(
      '$x characters allowed.',
      name: 'maxLength',
      desc: '',
      args: [x],
    );
  }

  /// `Invalid format. Please re-enter the field.`
  String get invalidFormat {
    return Intl.message(
      'Invalid format. Please re-enter the field.',
      name: 'invalidFormat',
      desc: '',
      args: [],
    );
  }

  /// `Invalid format. This field must be number.`
  String get thisFieldMustBeNumber {
    return Intl.message(
      'Invalid format. This field must be number.',
      name: 'thisFieldMustBeNumber',
      desc: '',
      args: [],
    );
  }

  /// `Wrong password.`
  String get wrongPassword {
    return Intl.message(
      'Wrong password.',
      name: 'wrongPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password does not match.`
  String get passwordDoesNotMatch {
    return Intl.message(
      'Password does not match.',
      name: 'passwordDoesNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUp {
    return Intl.message(
      'Sign up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `First name`
  String get firstName {
    return Intl.message(
      'First name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Last name`
  String get lastName {
    return Intl.message(
      'Last name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Date of birth`
  String get dateOfBirth {
    return Intl.message(
      'Date of birth',
      name: 'dateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong, please try again later.`
  String get somethingWentWrongPleaseTryAgainLater {
    return Intl.message(
      'Something went wrong, please try again later.',
      name: 'somethingWentWrongPleaseTryAgainLater',
      desc: '',
      args: [],
    );
  }

  /// `You must accept terms and conditions to continue`
  String get youMustAcceptTerms {
    return Intl.message(
      'You must accept terms and conditions to continue',
      name: 'youMustAcceptTerms',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirmPassword {
    return Intl.message(
      'Confirm password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Email already exists.`
  String get emailAlreadyExists {
    return Intl.message(
      'Email already exists.',
      name: 'emailAlreadyExists',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ja'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
