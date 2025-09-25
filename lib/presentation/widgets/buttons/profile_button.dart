import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  final String? name;
  final ValueChanged<String> onPressed;

  const ProfileButton({
    super.key,
    this.name,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [],
    );
  }

  String getDisplayName(String email) {
    String prefix = email.split('@')[0];
    return prefix[0].toUpperCase() + prefix.substring(1).toLowerCase();
  }
}
