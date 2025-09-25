import 'package:flutter/material.dart';

class ProductCategoryMenu extends StatefulWidget {
  final List<String> categories;
  const ProductCategoryMenu({super.key, required this.categories});

  @override
  ProductCategoryMenuState createState() => ProductCategoryMenuState();
}

class ProductCategoryMenuState extends State<ProductCategoryMenu> {
  String? _selectedCategory;
  late List<String> _categories;

  @override
  void initState() {
    _categories = widget.categories;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        hintText: 'Category',
        border: InputBorder.none,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
      value: _selectedCategory,
      items: _categories.map((String category) {
        return DropdownMenuItem<String>(
          value: category,
          child: Text(category),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          _selectedCategory = newValue;
        });
      },
    );
  }
}
