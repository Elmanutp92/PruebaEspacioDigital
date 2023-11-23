import 'package:flutter/material.dart';
import 'package:prueba_espacio_digital/components/register/widgets/form_use_register.dart';
import 'package:prueba_espacio_digital/presentation/screens/home.dart';
import 'package:prueba_espacio_digital/presentation/screens/login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Prueba Espacio Digital'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text(
                  'Registrarse',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                FormUseRegister(
                  notification: notification,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const LoginScreen();
                    }));
                  },
                  child: const Text('Iniciar sesión'),
                ),
              ],
            ),
          )),
    );
  }

  void notification(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
    message == 'Registro exitoso'
        ? Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()))
        : null;
  }
}
