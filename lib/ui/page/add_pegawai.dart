import 'package:flutter/material.dart';

class AddPegawaiPage extends StatefulWidget {
  static const String routeName = '/AddPegawaiPage';
  @override
  _AddPegawaiPageState createState() => _AddPegawaiPageState();
}

class _AddPegawaiPageState extends State<AddPegawaiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Pegawai'),
      ),
      body: Column(
        children: [
          TemplateTextFormField(),
        ],
      ),
    );
  }
}

class TemplateTextFormField extends StatelessWidget {
  const TemplateTextFormField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Nama',
        prefixIcon: Icon(Icons.person),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
