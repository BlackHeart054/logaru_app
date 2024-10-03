// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on _AuthStoreBase, Store {
  late final _$emailAtom = Atom(name: '_AuthStoreBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_AuthStoreBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$nameAtom = Atom(name: '_AuthStoreBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_AuthStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isLoggedInAtom =
      Atom(name: '_AuthStoreBase.isLoggedIn', context: context);

  @override
  bool get isLoggedIn {
    _$isLoggedInAtom.reportRead();
    return super.isLoggedIn;
  }

  @override
  set isLoggedIn(bool value) {
    _$isLoggedInAtom.reportWrite(value, super.isLoggedIn, () {
      super.isLoggedIn = value;
    });
  }

  late final _$loginErrorAtom =
      Atom(name: '_AuthStoreBase.loginError', context: context);

  @override
  String? get loginError {
    _$loginErrorAtom.reportRead();
    return super.loginError;
  }

  @override
  set loginError(String? value) {
    _$loginErrorAtom.reportWrite(value, super.loginError, () {
      super.loginError = value;
    });
  }

  late final _$loggedInUserAtom =
      Atom(name: '_AuthStoreBase.loggedInUser', context: context);

  @override
  User? get loggedInUser {
    _$loggedInUserAtom.reportRead();
    return super.loggedInUser;
  }

  @override
  set loggedInUser(User? value) {
    _$loggedInUserAtom.reportWrite(value, super.loggedInUser, () {
      super.loggedInUser = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('_AuthStoreBase.login', context: context);

  @override
  Future<void> login(BuildContext context) {
    return _$loginAsyncAction.run(() => super.login(context));
  }

  late final _$signUpAsyncAction =
      AsyncAction('_AuthStoreBase.signUp', context: context);

  @override
  Future<void> signUp(String email, String password, String? name) {
    return _$signUpAsyncAction.run(() => super.signUp(email, password, name));
  }

  late final _$_AuthStoreBaseActionController =
      ActionController(name: '_AuthStoreBase', context: context);

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String value) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _showDialog(BuildContext context) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase._showDialog');
    try {
      return super._showDialog(context);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void logout() {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.logout');
    try {
      return super.logout();
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
name: ${name},
isLoading: ${isLoading},
isLoggedIn: ${isLoggedIn},
loginError: ${loginError},
loggedInUser: ${loggedInUser}
    ''';
  }
}
