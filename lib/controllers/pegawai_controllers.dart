import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:aplikasi_gaji_pegawai/models/pegawai_model.dart';
import 'package:aplikasi_gaji_pegawai/utils/utils.dart';

import 'package:http/http.dart' as http;

class PegawaiController {
  PegawaiModel pegawaiModel;
  http.Response response;

  Future<PegawaiModel> getListPegawai() async {
    String url = Utils.listPegawai;
    response = await http.get(url);

    pegawaiModel = PegawaiModel.fromJson(jsonDecode(response.body));
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
      return true;
    }
    return false;
  }
}
