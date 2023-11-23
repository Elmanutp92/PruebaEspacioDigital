import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> signIn(String emailAddress, String password, context,
    Function setLoading, Function notification) async {
  setLoading();
  try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailAddress, password: password);
    if (credential.user != null) {
      notification(context, 'Inicio de sesión exitoso');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Inicio de sesión fallido')));
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      notification(context, 'Usuario no encontrado');
    } else if (e.code == 'wrong-password') {
      notification(context, e.code);
    } else {
      notification(context, 'Contraseña o Correo incorrectos');
    }
  } catch (e) {
    notification(context, 'Error inesperado: $e');
  } finally {
    setLoading();
  }
}
