import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:logaru/stores/auth_store.dart';
import 'package:provider/provider.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  // Função que verifica se os campos estão corretos
  bool _validateFields(AuthStore authStore) {
    if (authStore.name.isEmpty) {
      return false;
    }
    if (authStore.email.isEmpty || !authStore.email.contains('@')) {
      return false;
    }
    if (authStore.password.isEmpty || authStore.password.length < 6) {
      return false;
    }
    // Adicionar outras verificações como telefone, confirmar senha etc.
    return true;
  }

  // Função que exibe um alerta com informações
  void _showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Ajuda'),
          content: const Text(
              'Para criar uma conta, preencha todos os campos obrigatórios, '
              'incluindo nome, email, senha e endereço. Sua senha deve conter pelo menos 6 caracteres.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final authStore = Provider.of<AuthStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Criação de conta'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: () {
              _showInfoDialog(context); // Chama o diálogo de ajuda
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),
              Observer(
                builder: (_) => TextField(
                  onChanged: authStore.setName,
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    errorText:
                        authStore.name.isEmpty ? 'Campo obrigatório' : null,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Observer(
                builder: (_) => TextField(
                  onChanged: authStore.setEmail,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    errorText: authStore.email.isEmpty ||
                            !authStore.email.contains('@')
                        ? 'Email inválido'
                        : null,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Observer(
                builder: (_) => TextField(
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    labelText: 'Telefone',
                    prefixIcon: const Icon(Icons.phone),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Observer(
                builder: (_) => TextField(
                  onChanged: authStore.setPassword,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    errorText: authStore.password.isEmpty ||
                            authStore.password.length < 6
                        ? 'A senha deve ter no mínimo 6 caracteres'
                        : null,
                  ),
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 16),
              Observer(
                builder: (_) => TextField(
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    labelText: 'Confirmar senha',
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 16),
              Observer(
                builder: (_) => TextField(
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    labelText: 'Endereço',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  maxLines: 3,
                ),
              ),
              const SizedBox(height: 24),
              Observer(
                builder: (_) => authStore.isLoading
                    ? const CircularProgressIndicator()
                    : SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_validateFields(authStore)) {
                              authStore
                                  .signUp(authStore.email, authStore.password,
                                      authStore.name)
                                  .then((e) => Navigator.pop(context));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Por favor, preencha todos os campos corretamente.'),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(16.0),
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Cadastrar',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Já possui uma conta?'),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Entre'),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Text(
                  'Ao efetuar o cadastro, você estará concordando com os nossos Termos e Política de Privacidade.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
