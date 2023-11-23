import 'package:flutter/material.dart';
import 'package:prueba_espacio_digital/firebase/auth/sing_in.dart';

import 'form_items_exports.dart';

class FormUse extends StatefulWidget {
  final Function notification;
  final String labelButton;

  const FormUse(
      {super.key, required this.notification, required this.labelButton});

  @override
  State<FormUse> createState() => _FormUseState();
}

class _FormUseState extends State<FormUse> {
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
                      signIn(_emailController.text, _passwordController.text,
                          context, setLoading, widget.notification);
                    }
                  },
                  child: isLoading
                      ? const CircularProgressIndicator(
                          strokeWidth: 2,
                        )
                      : Text(widget.labelButton),
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
