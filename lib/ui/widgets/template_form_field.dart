import 'package:flutter/material.dart';

class TemplateTextFormField extends StatelessWidget {
  final String label;
  final IconData icon;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;

  const TemplateTextFormField({
    Key key,
    this.label = 'label',
    this.icon = Icons.label,
    this.textEditingController,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextFormField(
        validator: (text) {
          if (text == null || text.isEmpty) {
            return 'Inputan tidak boleh kosong';
          }
          return null;
        },
        controller: textEditingController,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            labelText: label,
            hintText: 'Masukkan $label disini',
            prefixIcon: Icon(icon),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            )),
      ),
    );
  }
}
