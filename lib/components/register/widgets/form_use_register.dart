import 'package:flutter/material.dart';
import 'package:prueba_espacio_digital/firebase/auth/register_auth.dart';

import '../../login/widgets/form/form_items_exports.dart';

class FormUseRegister extends StatefulWidget {
  final Function notification;

  const FormUseRegister({
    super.key,
    required this.notification,
  });

  @override
  State<FormUseRegister> createState() => _FormUseRegisterState();
}

class _FormUseRegisterState extends State<FormUseRegister> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              EmailField(
                emailController: _emailController,
              ),
              PasswordField(
                passwordController: _passwordController,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      register(_emailController.text, _passwordController.text,
                          widget.notification, setLoading);
                    }
                  },
                  child: isLoading
                      ? const CircularProgressIndicator(
                          strokeWidth: 2,
                        )
                      : const Text('Registrarse'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void setLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
