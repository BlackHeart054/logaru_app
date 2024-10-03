import 'package:flutter/material.dart';
import 'package:logaru/interfaces/user_interface.dart';
import 'package:logaru/views/menu_view.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final List<User?> users = [
    User(
      email: 'lucas.menezes@logaru.com',
      password: 'admin123',
    ),
    User(email: 'ana.luiza@logaru.com', password: 'admin123'),
    User(email: 'pedro.rocha@logaru.com', password: 'admin123'),
  ];

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String name = '';

  @observable
  bool isLoading = false;

  @observable
  bool isLoggedIn = false;

  @observable
  String? loginError;

  @observable
  User? loggedInUser;

  @action
  void setEmail(String value) {
    email = value;
  }

  @action
  void setName(String value) {
    name = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  Future<void> login(BuildContext context) async {
    isLoading = true;
    loginError = null;

    await Future.delayed(const Duration(seconds: 2));

    final validUser = users.firstWhere(
        (u) => u?.email == email && u?.password == password,
        orElse: () => User(email: '', password: ''));

    if (validUser?.email != '' && validUser?.password != '') {
      isLoggedIn = true;
      loggedInUser = validUser;
      isLoading = false;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MainView()),
      );
    } else {
      loginError = "Erro ao efetuar login";
      isLoading = false;
      _showDialog(context);
    }
  }

  @action
  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Credenciais inválidas"),
          content: const Text("Usuário ou senha inválidos"),
          actions: <Widget>[
            TextButton(
              child: const Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @action
  Future<void> signUp(
    String email,
    String password,
    String? name,
  ) async {
    isLoading = true;
    await Future.delayed(const Duration(seconds: 2));

    final existingUser = users.any((user) => user?.email == email);
    if (!existingUser) {
      users.add(User(email: email, password: password));
      loggedInUser = User(email: email, password: password);
      isLoggedIn = true;
    } else {
      loginError = "Email já cadastrado!";
      isLoggedIn = false;
    }

    isLoading = false;
  }

  @action
  void logout() {
    isLoggedIn = false;
    loggedInUser = null;
    email = '';
    password = '';
  }
}
