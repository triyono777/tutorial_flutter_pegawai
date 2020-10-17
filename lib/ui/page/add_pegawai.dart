import 'package:aplikasi_gaji_pegawai/controllers/pegawai_controllers.dart';
import 'package:aplikasi_gaji_pegawai/ui/widgets/template_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddPegawaiPage extends StatefulWidget {
  static const String routeName = '/AddPegawaiPage';
  @override
  _AddPegawaiPageState createState() => _AddPegawaiPageState();
}

class _AddPegawaiPageState extends State<AddPegawaiPage> {
  TextEditingController namaController = TextEditingController();
  TextEditingController gajiController = TextEditingController();
  TextEditingController umurController = TextEditingController();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Add Pegawai'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TemplateTextFormField(
              keyboardType: TextInputType.text,
              textEditingController: namaController,
              icon: Icons.person,
              label: 'Nama',
            ),
            TemplateTextFormField(
              keyboardType: TextInputType.number,
              textEditingController: umurController,
              icon: Icons.cake,
              label: 'Umur',
            ),
            TemplateTextFormField(
              keyboardType: TextInputType.number,
              textEditingController: gajiController,
              icon: Icons.monetization_on,
              label: 'Gaji',
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Provider.of<PegawaiController>(context, listen: false)
                      .addPegawai(
                    nama: namaController.text,
                    gaji: gajiController.text,
                    umur: umurController.text,
                  )
                      .then((value) {
                    value == true
                        ? Navigator.of(context).pop(true)
                        : _scaffoldKey.currentState.showSnackBar(
                            SnackBar(content: Text('Gagal Add Pegawai')));
                  });
                }
              },
              child: Text('Add Pegawai'),
            ),
          ],
        ),
      ),
    );
  }
}
