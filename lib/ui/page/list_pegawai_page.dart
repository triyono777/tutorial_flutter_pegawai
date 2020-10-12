import 'package:aplikasi_gaji_pegawai/ui/page/add_pegawai.dart';
import 'package:flutter/material.dart';

class ListPegawaiPage extends StatefulWidget {
  @override
  _ListPegawaiPageState createState() => _ListPegawaiPageState();
}

class _ListPegawaiPageState extends State<ListPegawaiPage> {
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
}
