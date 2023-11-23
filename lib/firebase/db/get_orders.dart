import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:prueba_espacio_digital/models/item.dart';

Stream<List<Item>> getOrders() {
  final user = FirebaseAuth.instance.currentUser;
  final db = FirebaseFirestore.instance;

  try {
    return db
        .collection('users')
        .doc(user!.uid)
        .collection('orders')
        .snapshots()
        .map((snapshot) {
      final List<Item> orderList = [];

      for (var element in snapshot.docs) {
        orderList.add(Item(
          id: element.id,
          description: element['description'],
          price: element['price'],
        ));
      }

      return orderList;
    });
  } on FirebaseException {
    rethrow; // Puedes optar por lanzar la excepción nuevamente si es necesario
  } on Exception catch (e) {
    // ignore: avoid_print
    print('Error general: $e');
    rethrow;
  }
}
