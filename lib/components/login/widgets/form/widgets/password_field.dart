import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController passwordController;
  const PasswordField({
    super.key,
    required this.passwordController,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: widget.passwordController,
        obscureText: obscureText,
        decoration: InputDecoration(
          suffixIcon: obscureText
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  icon: const Icon(Icons.visibility_off))
              : IconButton(
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  icon: const Icon(Icons.visibility)),
          border: const OutlineInputBorder(),
          labelText: 'Contraseña',
          hintText: 'Ingrese su contraseña',
        ),
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Por favor ingrese su contraseña';
          }
          if (value.length < 6) {
            return 'La contraseña debe tener al menos 6 caracteres';
          }
          return null;
        },
      ),
    );
  }
}
