import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prueba_espacio_digital/components/home/order_list.dart';
import 'package:prueba_espacio_digital/firebase/sing_out.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                singOut(context);
              },
              icon: const Icon(Icons.logout)),
          automaticallyImplyLeading: false,
          title: const Text('Ordenes'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                      'Bienvenido ${FirebaseAuth.instance.currentUser!.email}'),
                  const SizedBox(
                    height: 20,
                  ),
                  const OrderList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
