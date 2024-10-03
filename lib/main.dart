import 'package:flutter/material.dart';
import 'package:logaru/stores/auth_store.dart';
import 'package:logaru/stores/restaurant_store.dart';
import 'package:logaru/views/login_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthStore>(create: (_) => AuthStore()),
        Provider<RestaurantStore>(create: (_) => RestaurantStore()),
      ],
      child: MaterialApp(
        title: 'Logaru Restaurant',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: const LoginView(),
      ),
    );
  }
}
