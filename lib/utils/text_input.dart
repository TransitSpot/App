import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    Key? key,
    required this.nameController,
    required this.nameFocusNode,
    required this.nameField,
    required this.hint,
    this.isPassword = false,
  }) : super(key: key);

  final TextEditingController nameController;
  final FocusNode nameFocusNode;
  final String nameField;
  final String hint;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LabelText(text: nameField),
          const SizedBox(
            height: 10,
          ),
          TextField(
            obscureText: isPassword,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: hint,
            ),
            style: const TextStyle(fontSize: 15.0, color: Colors.black),
            controller: nameController,
            focusNode: nameFocusNode,
          ),
        ],
      ),
    );
  }
}

class LabelText extends StatelessWidget {
  const LabelText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),
    );
  }
}
