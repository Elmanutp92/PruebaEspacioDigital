import 'package:flutter/material.dart';
import 'package:prueba_espacio_digital/firebase/db/delete_item.dart';
import 'package:prueba_espacio_digital/models/item.dart';

class ItemCard extends StatefulWidget {
  final Function notification;
  const ItemCard({
    super.key,
    required this.item,
    required this.notification,
  });

  final Item item;

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ),
          )
        : Card(
            child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(widget.item.description),
                  IconButton(
                      onPressed: () {
                        deleteItem(
                            widget.item.id, widget.notification, setLoading);
                      },
                      icon: const Icon(Icons.delete)),
                ],
              ),
              const Spacer(),
              Text('\$${widget.item.price.toString()}',
                  style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              const SizedBox(
                height: 20,
              )
            ],
          ));
  }

  void setLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
