// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on _LoginStoreBase, Store {
  late final _$isLoggedInStatusAtom =
      Atom(name: '_LoginStoreBase.isLoggedInStatus', context: context);

  @override
  StateStatus get isLoggedInStatus {
    _$isLoggedInStatusAtom.reportRead();
    return super.isLoggedInStatus;
  }

  @override
  set isLoggedInStatus(StateStatus value) {
    _$isLoggedInStatusAtom.reportWrite(value, super.isLoggedInStatus, () {
      super.isLoggedInStatus = value;
    });
  }

  late final _$isLoggedInAtom =
      Atom(name: '_LoginStoreBase.isLoggedIn', context: context);

  @override
  bool? get isLoggedIn {
    _$isLoggedInAtom.reportRead();
    return super.isLoggedIn;
  }

  @override
  set isLoggedIn(bool? value) {
    _$isLoggedInAtom.reportWrite(value, super.isLoggedIn, () {
      super.isLoggedIn = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_LoginStoreBase.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$doLoginAsyncAction =
      AsyncAction('_LoginStoreBase.doLogin', context: context);

  @override
  Future<void> doLogin(BuildContext context, PostLoginRequestModel params,
      {PageRouteInfo<dynamic>? redirectOnLogin}) {
    return _$doLoginAsyncAction.run(
        () => super.doLogin(context, params, redirectOnLogin: redirectOnLogin));
  }

  late final _$getAuthenticationAsyncAction =
      AsyncAction('_LoginStoreBase.getAuthentication', context: context);

  @override
  Future<void> getAuthentication(BuildContext context) {
    return _$getAuthenticationAsyncAction
        .run(() => super.getAuthentication(context));
  }

  late final _$logoutAsyncAction =
      AsyncAction('_LoginStoreBase.logout', context: context);

  @override
  Future<void> logout(BuildContext context, {bool? redirectToHome}) {
    return _$logoutAsyncAction
        .run(() => super.logout(context, redirectToHome: redirectToHome));
  }

  @override
  String toString() {
    return '''
isLoggedInStatus: ${isLoggedInStatus},
isLoggedIn: ${isLoggedIn},
errorMessage: ${errorMessage}
    ''';
  }
}
