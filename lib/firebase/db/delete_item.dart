import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> deleteItem(
    String documentId, Function notification, Function setLoading) async {
  final user = FirebaseAuth.instance.currentUser;
  final db = FirebaseFirestore.instance;

  try {
    setLoading();

    // Elimina el documento
    await db
        .collection('users')
        .doc(user!.uid)
        .collection('orders')
        .doc(documentId)
        .delete();

    // Verifica si el documento se eliminó correctamente
    DocumentSnapshot documentSnapshot = await db
        .collection('users')
        .doc(user.uid)
        .collection('orders')
        .doc(documentId)
        .get();

    if (!documentSnapshot.exists) {
      notification('Se ha borrado correctamente.');
    } else {
      notification('Error al borrar en Firestore.');
    }
  } on FirebaseException catch (e) {
    // Maneja excepciones específicas de Firebase
    notification('Error al borrar en Firestore: ${e.message}');
  } catch (e, stackTrace) {
    // Maneja otras excepciones y registra detalles para depuración
    print('Error al borrar en Firestore: $e\n$stackTrace');
    notification('Error al borrar en Firestore.');
  } finally {
    setLoading();
  }
}
