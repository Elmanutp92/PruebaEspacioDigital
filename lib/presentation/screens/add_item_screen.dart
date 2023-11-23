import 'package:flutter/material.dart';
import 'package:prueba_espacio_digital/firebase/db/new_order.dart';
import 'package:prueba_espacio_digital/models/item.dart';

class AddItem extends StatelessWidget {
  final Function notification;
  const AddItem({Key? key, required this.notification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController descripcionController = TextEditingController();

    return SafeArea(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.9,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 16.0),
                FormAddItem(
                    descripcionController: descripcionController,
                    notification: notification),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FormAddItem extends StatefulWidget {
  final Function notification;
  const FormAddItem({
    super.key,
    required this.descripcionController,
    required this.notification,
  });

  final TextEditingController descripcionController;

  @override
  State<FormAddItem> createState() => _FormAddItemState();
}

class _FormAddItemState extends State<FormAddItem> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _descripcionController = TextEditingController();
  final TextEditingController _precioController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese una descripción';
                    }
                    return null;
                  },
                  controller: _descripcionController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Descripción',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese un precio';
                    }

                    return null;
                  },
                  controller: _precioController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Precio',
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    double? price = double.tryParse(_precioController.text);
                    await addOrder(
                        Item(
                          description: _descripcionController.text,
                          price: price!,
                          id: '',
                        ),
                        widget.notification,
                        setLoading);
                  }
                },
                child: Text(!isLoading ? 'Agregar' : 'Cargando...'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void setLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
