import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:prueba_espacio_digital/components/home/widgets/item_card.dart';
import 'package:prueba_espacio_digital/firebase/db/delete_item.dart';
import 'package:prueba_espacio_digital/firebase/db/get_orders.dart';
import 'package:prueba_espacio_digital/models/item.dart';
import 'package:prueba_espacio_digital/presentation/screens/add_item_screen.dart';
import 'package:prueba_espacio_digital/presentation/screens/home.dart';

class OrderList extends StatefulWidget {
  const OrderList({
    super.key,
  });

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  bool vista = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: getOrders(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error al obtener los datos'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final List<Item> items = snapshot.data as List<Item>;

          return SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'Lista de ordenes',
                      textAlign: TextAlign.center,
                    ),
                    TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) => AddItem(
                                    notification: notification,
                                  ));
                        },
                        child: const Text('Agregar orden'))
                  ],
                ),
                SizedBox(
                    //color: Colors.grey[300],
                    height: 500,
                    child: !vista
                        ? GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              final Item item = items[index];
                              return FadeIn(
                                child: ItemCard(item: item),
                              );
                            })
                        : ListView.builder(
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              final Item item = items[index];
                              return FadeIn(
                                  child: ListTile(
                                title: Text(item.description),
                                subtitle: Text(
                                  '\$${item.price.toString()}',
                                  style: const TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                trailing: IconButton(
                                    onPressed: () {
                                      deleteItem(
                                          item.id, notification, setLoading);
                                    },
                                    icon: const Icon(Icons.delete)),
                              ));
                            })),
                TextButton(
                    onPressed: () {
                      setState(() {
                        vista = !vista;
                      });
                    },
                    child: const Text('Cambiar vista'))
              ],
            ),
          );
        });
  }

  void setLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  void notification(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
    message == 'Se ha guardado correctamente.'
        ? Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()))
        : null;
  }
}
