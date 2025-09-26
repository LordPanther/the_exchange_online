import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_exchange_online/constants/font_constant.dart';
import 'package:the_exchange_online/data/models/shop_model.dart';
import 'package:the_exchange_online/presentation/common_blocs/shop/shop_bloc.dart';
import 'package:the_exchange_online/presentation/common_blocs/shop/shop_event.dart';

class CreateShopScreen extends StatefulWidget {
  const CreateShopScreen({super.key});

  @override
  State<CreateShopScreen> createState() => _CreateShopScreenState();
}

class _CreateShopScreenState extends State<CreateShopScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  onCreateShop(ShopModel shop) {
    BlocProvider.of<ShopBloc>(context).add(CreateShop(shop));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Register Your Store", style: FONT_CONST.BOLD_BLACK_28),
                  SizedBox(height: 24),
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: "Store Name"),
                    validator: (v) =>
                        v == null || v.isEmpty ? "Enter a name" : null,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _descController,
                    decoration: InputDecoration(labelText: "Description"),
                    validator: (v) =>
                        v == null || v.isEmpty ? "Enter a description" : null,
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final shop = ShopModel(
                          id: UniqueKey().toString(),
                          name: _nameController.text,
                          description: _descController.text,
                          tenant: null,
                          email: null,
                          phoneNumber: null,
                          isActive: true,
                          createdAt: DateTime.now().toIso8601String(),
                          updatedAt: DateTime.now().toIso8601String(),
                        );
                        onCreateShop(shop);
                      }
                    },
                    child: Text("Create Store"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
