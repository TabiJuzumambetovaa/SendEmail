import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.label,
    required this.controller,
    this.prefix,
    this.suffix,
    this.maxLines = 1, 
    this.keyboardType=TextInputType.text
  }) : super(key: key);

  final String label;
  final String hintText;
  final Icon? suffix;
  final Icon? prefix;
  final TextEditingController controller;
  final int maxLines;
  final TextInputType keyboardType;

  String? _validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.red), 
        ),
        const SizedBox(height: 8),
        TextFormField(
          keyboardType:keyboardType ,
          controller: controller,
          maxLines: maxLines,
          validator: _validateInput,
          decoration: InputDecoration(
            
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            
            hintText: hintText,
            hintStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xff6C727F),
            ),
            labelText: label,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
            prefixIcon: prefix,
            suffixIcon: suffix,
          ),
        ),
      ],
    );
  }
}
