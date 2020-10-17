import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:aplikasi_gaji_pegawai/models/pegawai_model.dart';
import 'package:aplikasi_gaji_pegawai/utils/utils.dart';

import 'package:http/http.dart' as http;

class PegawaiController extends ChangeNotifier {
  PegawaiModel pegawaiModel;
  http.Response response;

  Future<PegawaiModel> getListPegawai() async {
    String url = Utils.listPegawai;
    response = await http.get(url);

    pegawaiModel = PegawaiModel.fromJson(jsonDecode(response.body));
    notifyListeners();
    return pegawaiModel;
  }

  Future<bool> addPegawai({
    @required String nama,
    @required String gaji,
    @required String umur,
  }) async {
    String url = Utils.addPegawai;
    response = await http.post(url, body: {
      'employee_name': nama,
      'employee_salary': gaji,
      'employee_age': umur
    });

    final hasil = jsonDecode(response.body);
    print(hasil);
    if (hasil['status'] == 'success') {
      getListPegawai();
      return true;
    }
    return false;
  }

  Future<bool> updatePegawai({
    @required String nama,
    @required String gaji,
    @required String umur,
    @required String id,
  }) async {
    String url = Utils.updatePegawai;
    response = await http.post(url, body: {
      'id': id,
      'employee_name': nama,
      'employee_salary': gaji,
      'employee_age': umur
    });

    final hasil = jsonDecode(response.body);

    if (hasil['status'] == 'success') {
      getListPegawai();
      return true;
    }

    return false;
  }

  Future<bool> deletePegawai({@required String id}) async {
    String url = Utils.deletePegawai;
    response = await http.get(url + '?id=$id');
    getListPegawai();

    return true;
  }
}
