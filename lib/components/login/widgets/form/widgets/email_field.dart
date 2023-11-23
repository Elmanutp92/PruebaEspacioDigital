import 'package:flutter/material.dart';

class EmailField extends StatefulWidget {
  final TextEditingController emailController;
  const EmailField({
    super.key,
    required this.emailController,
  });

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: widget.emailController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Correo electrónico',
          hintText: 'Ingrese su correo electrónico',
        ),
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Por favor ingrese su correo electrónico';
          }
          RegExp regex =
              RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
          if (!regex.hasMatch(value)) {
            return 'Correo electrónico no válido';
          }
          return null;
        },
      ),
    );
  }
}
