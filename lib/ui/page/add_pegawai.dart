import 'package:aplikasi_gaji_pegawai/ui/widgets/template_form_field.dart';
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
          TemplateTextFormField(
            icon: Icons.person,
            label: 'Nama',
          ),
          TemplateTextFormField(
            icon: Icons.cake,
            label: 'Umur',
          ),
          TemplateTextFormField(
            icon: Icons.monetization_on,
            label: 'Gaji',
          ),
        ],
      ),
    );
  }
}
