import 'dart:convert';

import 'package:app_ongkir/app/data/models/ongkir_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {

  List<Ongkir> ongkosKirim = []; 

  TextEditingController beratC = TextEditingController();

  RxString provinsiAsalId = "0".obs;
  RxString cityAsalId = "0".obs;
  RxString provinsiTujuanlId = "0".obs;
  RxString cityTujuanId = "0".obs;
  RxString codeKurir = "".obs;

  RxBool isLoading = false.obs;

  void cekOngkir() async{
    if (provinsiAsalId != "0" &&
        provinsiTujuanlId != "0" &&
        cityAsalId != "0" &&
        cityTujuanId != "0" &&
        codeKurir != 0 &&
        beratC != "") {
      //eksekusi

      try {
        isLoading.value = true;
        var response = await http.post(
          Uri.parse("https://api.rajaongkir.com/starter/cost"),
          headers: {
            "key": "bebae5a1d91ae56697fa5a1cd414b60c",
            "content-type" : "application/x-www-form-urlencoded"
          },
          body: {
            "origin": cityAsalId.value,
            "destination": cityTujuanId.value,
            "weight": beratC.text,
            "courier": codeKurir.value,
          },
          );
          isLoading.value = false;
          List ongkir = json.decode(response.body)["rajaongkir"]["results"][0]["costs"] as List;
          ongkosKirim = Ongkir.fromJsonList(ongkir);
          
          Get.defaultDialog(
            title: "ONGKOS KIRIM",
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: ongkosKirim.map((e) => ListTile(
                title: Text("${e.service}"),
                subtitle: Text("Rp. ${e.cost![0].value}"),
              )).toList(),
            )
          );
      } catch (e) {
        print(e);
        Get.showSnackbar(GetSnackBar(
          message: "Tidak dapat mengecek ongkos kirim.",
          duration: Duration(seconds: 2),
          snackStyle: SnackStyle.FLOATING,
          backgroundColor: Color.fromARGB(255, 109, 109, 109),
          margin: EdgeInsets.all(20),
        ));
      }
    } else {
      Get.showSnackbar(GetSnackBar(
        message: "Data harus lengkap!",
        duration: Duration(seconds: 2),
        snackStyle: SnackStyle.FLOATING,
        backgroundColor: Color.fromARGB(255, 109, 109, 109),
        margin: EdgeInsets.all(20),
      ));
    }
  }
}
