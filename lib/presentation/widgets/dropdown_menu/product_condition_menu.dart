import 'package:flutter/material.dart';

class ProductConditionMenu extends StatefulWidget {
  final ValueChanged<String> onPressed;
  const ProductConditionMenu({super.key, required this.onPressed});

  @override
  ProductConditionMenuState createState() => ProductConditionMenuState();
}

class ProductConditionMenuState extends State<ProductConditionMenu> {
  String? _selectedCondition;

  final List<String> _condition = ['New', 'Like New', 'Good', 'Fair', 'Bad'];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        hintText: 'Choose product condition',
        border: InputBorder.none,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
      value: _selectedCondition,
      items: _condition.map((String condition) {
        return DropdownMenuItem<String>(
          value: condition,
          child: Text(condition),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          _selectedCondition = newValue;
          widget.onPressed(_selectedCondition!);
        });
      },
    );
  }
}
