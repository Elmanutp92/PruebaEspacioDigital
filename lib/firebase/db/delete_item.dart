import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> deleteItem(
    String documentId, Function notification, Function setLoading) async {
  final user = FirebaseAuth.instance.currentUser;
  final db = FirebaseFirestore.instance;

  try {
    setLoading();
    await db
        .collection('orders')
        .doc(user!.uid)
        .collection('orders')
        .doc(documentId)
        .delete();

    DocumentReference documentReference = db
        .collection('orders')
        .doc(user.uid)
        .collection('orders')
        .doc(documentId);
    if (documentReference.id.isEmpty) {
      notification('Se ha borrado correctamente.');
    } else {
      notification('Error al borrar en Firestore.');
    }
  } on FirebaseException catch (e) {
    notification('Error al borrar en Firestore ${e.message}');
    // Manejar las excepciones

    notification('Error al guardar en Firestore.');
  } catch (e) {
    notification('Error al borrar en Firestore ${e.toString()}');
  } finally {
    setLoading();
  }
}
