import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_exchange_online/constants/font_constant.dart';
import 'package:the_exchange_online/constants/image_constant.dart';
import 'package:the_exchange_online/data/models/shop_model.dart';
import 'package:the_exchange_online/presentation/screens/create_shop/bloc/create_shop_bloc.dart';
import 'package:the_exchange_online/presentation/screens/create_shop/bloc/create_shop_event.dart';

class CreateShopForm extends StatefulWidget {
  const CreateShopForm({super.key});

  @override
  State<CreateShopForm> createState() => _CreateShopFormState();
}

class _CreateShopFormState extends State<CreateShopForm> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _shopNameController = TextEditingController();
  final TextEditingController _shopDescriptionController =
      TextEditingController();

  @override
  void dispose() {
    _shopNameController.dispose();
    _shopDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(IMAGE_CONST.SHELTER, width: 100, height: 100),
                      SizedBox(height: 24),
                      Text(
                        "Register Your Shop",
                        style: FONT_CONST.BOLD_BLACK_28,
                      ),
                      SizedBox(height: 24),
                      TextFormField(
                        controller: _shopNameController,
                        decoration: InputDecoration(
                          labelText: "Shop Name",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a shop name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _shopDescriptionController,
                        decoration: InputDecoration(
                          labelText: "Description",
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 3,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a description';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final shop = ShopModel(
                                id: UniqueKey().toString(),
                                name: _shopNameController.text,
                                description: _shopDescriptionController.text,
                                tenant: null, // Set current user if available
                                email: null,
                                phoneNumber: null,
                                isActive: true,
                                createdAt: DateTime.now().toIso8601String(),
                                updatedAt: DateTime.now().toIso8601String(),
                              );
                              BlocProvider.of<CreateShopBloc>(
                                context,
                              ).add(CreateShop(shop));
                            }
                          },
                          child: Text("Create Shop"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
