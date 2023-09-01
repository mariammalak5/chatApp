import 'package:flutter/material.dart';

Widget textFormField(
    { TextEditingController? controller,
      required TextInputType type,
      required String? Function(String?)? validator,
      required String label,
      required IconData icon,
      IconData? suffixIcon,
      bool isPass = false,
      // String? Function(String?)? onSaved,
      void Function()? suffixPressed}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPass,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.white,
        ),
        label: Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(
          icon: Icon(suffixIcon),
          onPressed: suffixPressed,
        )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      validator: validator,
    );
