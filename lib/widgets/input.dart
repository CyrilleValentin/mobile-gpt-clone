import 'package:flutter/material.dart';

Widget myInput({
  bool obscureText = false,
  required suffixIcon,
  required String hintText,
  required TextEditingController controller,
  String? Function(String?)? validator,
  void Function(String?)? onSaved,
  void Function()? onEditingComplete,
   void Function(String)? onChanged,
}) {
  return TextFormField(
  onChanged: onChanged,
    controller: controller,
    obscureText: obscureText,
    style: const TextStyle(fontSize: 11),
    decoration: InputDecoration(
      hintText: hintText,
      suffixIcon: suffixIcon,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(30),
      ),
      filled: true,
      fillColor: Colors.grey[150],
      errorStyle: const TextStyle(
        color: Colors.red,
        fontSize: 11,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.red, width: 1),
      ),
    ),
    keyboardType: obscureText ? TextInputType.text : TextInputType.emailAddress,
    validator: validator,
    onSaved: onSaved,
  );
}
