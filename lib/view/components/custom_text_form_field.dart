import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {

  final String hint;
  final funValidator;
  final controller;

  const CustomTextFormField({
    required this.hint,
    required this.funValidator,
    this.controller}
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: SizedBox(
        height: 70,
        width: 350,
        child: TextFormField(
          controller: controller,
           validator:  funValidator,
          obscureText: hint=="Password" ? true : false,
          decoration: InputDecoration(
            labelText: '$hint',
            hintText: "Enter $hint",
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),

          ),
        ),
      ),
    );
  }
}