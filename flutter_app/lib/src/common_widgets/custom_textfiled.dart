import 'package:flutter/material.dart';
import 'package:flutter_app/src/constants/colors.dart';

// ignore: must_be_immutable
class CostomTextFormFild extends StatelessWidget {
  CostomTextFormFild(
      {Key? key,
      required this.hint,
      this.suffixIcon,
      this.onTapSuffixIcon,
      this.obscureText = false,
      this.validator,
      this.onChanged,
      this.onEditingComplete,
      this.controller,
      required this.prefixIcon,
      this.filled = false,
      this.enabled = true,
      this.initialValue})
      : super(key: key);
  String hint;
  IconData prefixIcon;
  IconData? suffixIcon;
  VoidCallback? onTapSuffixIcon;
  bool obscureText;
  bool filled;
  bool enabled;
  String? initialValue;

  TextEditingController? controller;
  Function()? onEditingComplete;

  String? Function(String?)? validator;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        initialValue: initialValue,
        onEditingComplete: onEditingComplete,
        controller: controller,
        onChanged: onChanged,
        validator: validator,
        obscureText: obscureText,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.white),
          ),
          hintText: hint,
          contentPadding: const EdgeInsets.all(0),
          hintStyle: const TextStyle(
            fontFamily: "Inter",
            fontWeight: FontWeight.bold
          ),
          prefixIcon: Icon(
            prefixIcon,
            color: Colors.black,
            size: 20,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              suffixIcon,
              color: bckgnd,
              size: 20,
            ),
            onPressed: onTapSuffixIcon,
          ),
          filled: filled,
          fillColor: Colors.white,
          enabled: enabled,
        ),
      ),
    );
  }
}
