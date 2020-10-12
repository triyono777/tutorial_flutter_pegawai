import 'package:aplikasi_gaji_pegawai/controllers/pegawai_controllers.dart';
import 'package:aplikasi_gaji_pegawai/models/pegawai_model.dart';
import 'package:aplikasi_gaji_pegawai/ui/page/add_pegawai.dart';
import 'package:flutter/material.dart';

class ListPegawaiPage extends StatefulWidget {
  @override
  _ListPegawaiPageState createState() => _ListPegawaiPageState();
}

class _ListPegawaiPageState extends State<ListPegawaiPage> {
  PegawaiModel pegawaiModel;

  @override
  void initState() {
    super.initState();
    getPegawai();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Pegawai'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (ctx, index) => ListTile(
          title: Text('Nama'),
          subtitle: Text('Umur'),
          trailing: Text('Gaji'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(AddPegawaiPage.routeName);
        },
      ),
    );
  }

  getPegawai() async {
    PegawaiController().getListPegawai().then((value) {
      setState(() {
        pegawaiModel = value;
      });
    });
  }
}
