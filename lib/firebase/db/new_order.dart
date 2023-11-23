import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:prueba_espacio_digital/models/item.dart';

Future<void> addOrder(
    Item order, Function notification, Function setLoading) async {
  setLoading();
  try {
    final user = FirebaseAuth.instance.currentUser;
    final db = FirebaseFirestore.instance;

    // Añadir el documento y obtener la referencia
    DocumentReference<Map<String, dynamic>> documentRef =
        await db.collection('users').doc(user!.uid).collection('orders').add({
      'description': order.description,
      'price': order.price,
    });

    String documentId = documentRef.id;

    await db
        .collection('users')
        .doc(user.uid)
        .collection('orders')
        .doc(documentId)
        .update({
      'id': documentId,
    });

    DocumentReference documentReference = db
        .collection('users')
        .doc(user.uid)
        .collection('orders')
        .doc(documentId);
    if (documentReference.id.isNotEmpty) {
      notification('Se ha guardado correctamente.');
    } else {
      notification('Error al guardar en Firestore.');
    }
  } on FirebaseException catch (e) {
    notification('Error al guardar en Firestore ${e.toString()}.}');

    notification('Error al guardar en Firestore.');
  } on Exception catch (e) {
    notification('Error al guardar en Firestore ${e.toString()}.}');

    notification('Error al guardar en Firestore.');
  } finally {
    setLoading();
  }
}
