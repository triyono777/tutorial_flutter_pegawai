import 'package:aplikasi_gaji_pegawai/controllers/pegawai_controllers.dart';
import 'package:aplikasi_gaji_pegawai/ui/page/add_pegawai.dart';
import 'package:aplikasi_gaji_pegawai/ui/page/update_pegawai_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListPegawaiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Pegawai'),
      ),
      body: RefreshIndicator(
        onRefresh: () => Provider.of<PegawaiController>(context, listen: false)
            .getListPegawai(),
        child: FutureBuilder(
            future: Provider.of<PegawaiController>(context, listen: false)
                .getListPegawai(),
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Consumer<PegawaiController>(
                builder: (ctx, data, _) => ListView.builder(
                  itemCount: data.pegawaiModel.data.length,
                  itemBuilder: (ctx, index) => GestureDetector(
                    onTap: () async {
                      await Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => UpdatePegawaiPage(
                          id: '${data.pegawaiModel.data[index].id}',
                          gaji:
                              '${data.pegawaiModel.data[index].employeeSalary}',
                          umur: '${data.pegawaiModel.data[index].employeeAge}',
                          nama: '${data.pegawaiModel.data[index].employeeName}',
                        ),
                      ));
                    },
                    child: Dismissible(
                      key: UniqueKey(),
                      direction: DismissDirection.endToStart,
                      confirmDismiss: (DismissDirection direction) async {
                        final bool res = await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Konfirmasi'),
                                content: Text('Kamu Yakin?'),
                                actions: <Widget>[
                                  FlatButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(true),
                                    child: Text('HAPUS'),
                                  ),
                                  FlatButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(false),
                                    child: Text('BATALKAN'),
                                  )
                                ],
                              );
                            });
                        return res;
                      },
                      onDismissed: (value) {
                        Provider.of<PegawaiController>(context, listen: false)
                            .deletePegawai(
                                id: data.pegawaiModel.data[index].id);
                      },
                      background: Container(
                        color: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.delete,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        child: Card(
                          child: ListTile(
                            title: Text(
                                'Nama ${data.pegawaiModel.data[index].employeeName}'),
                            subtitle: Text(
                                'Umur ${data.pegawaiModel.data[index].employeeAge}'),
                            trailing: Text(
                                'Gaji ${data.pegawaiModel.data[index].employeeSalary}'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          Navigator.of(context).pushNamed(
            AddPegawaiPage.routeName,
          );
        },
      ),
    );
  }
}
