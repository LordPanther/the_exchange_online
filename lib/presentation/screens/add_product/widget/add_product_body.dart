import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_exchange_online/configs/config.dart';
import 'package:the_exchange_online/constants/font_constant.dart';
import 'package:the_exchange_online/data/models/product_model.dart';
import 'package:the_exchange_online/presentation/common_blocs/shop/shop_bloc.dart';
import 'package:the_exchange_online/presentation/common_blocs/shop/shop_state.dart';
import 'package:the_exchange_online/presentation/widgets/dropdown_menu/product_condition_menu.dart';
import 'package:the_exchange_online/presentation/widgets/others/heading_widget.dart';
import 'package:the_exchange_online/presentation/widgets/others/loading.dart';
import 'package:the_exchange_online/presentation/widgets/others/sell_field_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:the_exchange_online/utils/snackbar.dart';

class AddProductBody extends StatefulWidget {
  const AddProductBody({super.key});

  @override
  State<AddProductBody> createState() => _AddProductBodyState();
}

class _AddProductBodyState extends State<AddProductBody> {
  late String _categoryId;
  late String _productDescription;
  late String _productName;
  late int _quantity;
  late double _originalPrice;
  late int _percentOff;
  late String _storeModelID;

  @override
  void initState() {
    super.initState();
  }

  final ImagePicker _picker = ImagePicker();
  final List<File?> _images = List<File?>.filled(6, null); // Up to 6 images
  final List<PlatformFile> _pickedImages = [];

  Future<void> _pickImage(int index) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _images[index] = File(pickedFile.path);
      });
    }
  }

  Future<void> _getImage(int index) async {
    var result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      withData: false,
      withReadStream: true,
      allowedExtensions: [
        'jpg',
        'jpeg',
        'png',
        'gif',
        'svg',
        'heic',
      ],
    );
    if (_pickedImages.contains(result!.files.single)) {
      return;
    }
    _pickedImages.add(result.files.single);
  }

  static bool valuesPopulated() {
    return true;
  }

  Future<void> onAddNewProduct(String option) async {
    ProductModel(
      categoryId: _categoryId,
      name: _productName,
      description: _productDescription,
      rating: 0,
      quantity: _quantity,
      image: _pickedImages.map((e) => e.path!).toList(),
      soldQuantity: 0,
      originalPrice: _originalPrice,
      percentOff: _percentOff,
      isAvailable: true,
      storemodelID: _storeModelID,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    if (_pickedImages.length < 3) {
      UtilSnackBar.showSnackBarContent(context, content: "Add atleast 3 images of your product");
    } else if (valuesPopulated()) {
      UtilSnackBar.showSnackBarContent(context, content: "Please populate all required fields/values");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopBloc, ShopState>(
      listener: (context, state) {
        if (state is ShopLoaded) {
          if (state.shop == null) {
            Navigator.of(context).pushNamed(AppRouter.MY_SHOP);
          }
        }
      },
      builder: (context, state) {
        if (state is ShopLoading) {
          return const Loading();
        }
        if (state is ShopLoaded) {
          return Padding(
            padding:
                EdgeInsets.symmetric(vertical: SizeConfig.defaultSize * 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HeadingWidget(
                    text: "Item",
                    style: FONT_CONST.MEDIUM_DEFAULT_24,
                  ),
                  SizedBox(height: SizeConfig.defaultSize * 2),
                  HeadingWidget(
                    text: "Add at least 3 images",
                    style: FONT_CONST.MEDIUM_DEFAULT_16,
                  ),
                  SizedBox(height: SizeConfig.defaultSize),
                  _buildProductImages(),
                  SizedBox(height: SizeConfig.defaultSize * 2),
                  HeadingWidget(
                    text: "Item description:*",
                    style: FONT_CONST.MEDIUM_DEFAULT_16,
                  ),
                  _buildProductDescription(),
                  SizedBox(height: SizeConfig.defaultSize * 2),
                  HeadingWidget(
                    text: "Product condition:*",
                    style: FONT_CONST.MEDIUM_DEFAULT_16,
                  ),
                  _buildProductCondition(), //popup
                  SizedBox(height: SizeConfig.defaultSize * 2),
                  HeadingWidget(
                    text: "Quantity",
                    style: FONT_CONST.MEDIUM_DEFAULT_16,
                  ),
                  _buildQuantity(),
                  SizedBox(height: SizeConfig.defaultSize * 2),
                  _buildDelivery(), //popup
                  SizedBox(height: SizeConfig.defaultSize * 2),
                  _buildPrice(),
                ],
              ),
            ),
          );
        }
        if (state is ShopLoadError) {
          return Center(child: Text(state.error));
        }
        return const Center(
          child: Text("Something went wrong."),
        );
      },
    );
  }

  Widget _buildProductImages() {
    return Row(
      children: [
        Expanded(
          child: _buildHorizontalList(),
        ),
      ],
    );
  }

  Widget _buildHorizontalList() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(6, (index) {
        return GestureDetector(
          onTap: () => _pickImage(index),
          child: Container(
            // margin: const EdgeInsets.all(10),
            constraints: BoxConstraints(
              minWidth: SizeConfig.defaultSize * 10,
              minHeight: SizeConfig.defaultSize * 10,
            ),
            width: SizeConfig.defaultSize * 15,
            height: SizeConfig.defaultSize * 15,
            color: Colors.blueGrey,
            child: _images[index] != null
                ? Image.file(
                    _images[index]!,
                    fit: BoxFit.cover,
                  )
                : const Icon(
                    Icons.add_photo_alternate,
                    color: Colors.white,
                  ),
          ),
        );
      }),
    );
  }

  Widget _buildProductDescription() {
    return SellFieldWidget(
        textInputType: TextInputType.text,
        hintText:
            "Enter a detailed description of the item you are selling. All information is necessary",
        onValueChanged: (value) {
          setState(() {
            _productDescription = value;
          });
        });
  }

  Widget _buildProductCondition() {
    return ProductConditionMenu(
      onPressed: (value) {},
    );
  }

  Widget _buildQuantity() {
    return SellFieldWidget(
      textInputType: TextInputType.number,
      hintText: "1",
      onValueChanged: (value) {
        _quantity = value;
      },
    );
  }

  Widget _buildDelivery() {
    return Placeholder();
  }

  Widget _buildPrice() {
    return Placeholder();
  }
}
