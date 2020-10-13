import 'package:aplikasi_gaji_pegawai/controllers/pegawai_controllers.dart';
import 'package:aplikasi_gaji_pegawai/models/pegawai_model.dart';
import 'package:aplikasi_gaji_pegawai/ui/page/add_pegawai.dart';
import 'package:aplikasi_gaji_pegawai/ui/page/update_pegawai_page.dart';
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
      body: pegawaiModel == null
          ? Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                Text('loading'),
              ],
            ))
          : RefreshIndicator(
              onRefresh: () => getPegawai(),
              child: ListView.builder(
                itemCount: pegawaiModel.data.length,
                itemBuilder: (ctx, index) => GestureDetector(
                  onTap: () async {
                    await Navigator.of(context)
                        .push(MaterialPageRoute(
                          builder: (ctx) => UpdatePegawaiPage(
                            id: '${pegawaiModel.data[index].id}',
                            gaji: '${pegawaiModel.data[index].employeeSalary}',
                            umur: '${pegawaiModel.data[index].employeeAge}',
                            nama: '${pegawaiModel.data[index].employeeName}',
                          ),
                        ))
                        .then((value) => getPegawai());
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Card(
                      child: ListTile(
                        title: Text(
                            'Nama ${pegawaiModel.data[index].employeeName}'),
                        subtitle: Text(
                            'Umur ${pegawaiModel.data[index].employeeAge}'),
                        trailing: Text(
                            'Gaji ${pegawaiModel.data[index].employeeSalary}'),
                      ),
                    ),
                  ),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          Navigator.of(context)
              .pushNamed(
                AddPegawaiPage.routeName,
              )
              .then(
                (value) => getPegawai(),
              );
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
