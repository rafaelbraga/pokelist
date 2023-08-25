import 'package:flutter/material.dart';
import 'package:poke_list/features/login/presentation/page/pokemons_list_page.dart';
import 'package:poke_list/features/login/presentation/state/home_provider.dart';
import 'package:provider/provider.dart';

class LoginHomePage extends StatefulWidget {
  const LoginHomePage({super.key});

  @override
  State<LoginHomePage> createState() => _LoginHomePageState();
}

class _LoginHomePageState extends State<LoginHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 16),
              const Text("Seja bem vindo treinador!"),
              TextFormField(
                controller: _usernameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite o nome de usuário';
                  }
                  return null;
                },
                decoration: const InputDecoration(labelText: 'Nome de usuário'),
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite a senha';
                  }
                  return null;
                },
                decoration: const InputDecoration(labelText: 'Senha'),
              ),
              const SizedBox(height: 16),
              homeProvider.isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await homeProvider.verifyLogin(
                              _usernameController.text,
                              _passwordController.text);
                        }
                        if (!homeProvider.isLogged) return;

                        handleLogin(context);
                      },
                      child: const Text('Login'),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> handleLogin(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PokemonsListPage(),
      ),
    );
  }
}
