import 'package:aplikasi_gaji_pegawai/controllers/pegawai_controllers.dart';
import 'package:aplikasi_gaji_pegawai/ui/page/add_pegawai.dart';
import 'package:aplikasi_gaji_pegawai/ui/page/list_pegawai_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PegawaiController()),
      ],
      child: MaterialApp(
        title: 'Aplikasi Pegawai',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ListPegawaiPage(),
        routes: {
          AddPegawaiPage.routeName: (ctx) => AddPegawaiPage(),
        },
      ),
    );
  }
}
