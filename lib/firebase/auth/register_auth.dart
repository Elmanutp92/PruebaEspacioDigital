import 'package:firebase_auth/firebase_auth.dart';

Future<void> register(
  String emailAddress,
  String password,
  Function notification,
  Function setLoading,
) async {
  setLoading();
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    if (credential.user != null) {
      notification('Registro exitoso');
    } else {
      notification('Registro fallido');
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      notification('La contraseña es muy débil');
    } else if (e.code == 'email-already-in-use') {
      notification('El correo ya está en uso');
    }
  } catch (e) {
    notification('Error inesperado: $e');
  } finally {
    setLoading();
  }
}
