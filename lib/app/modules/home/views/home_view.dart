import 'package:app_ongkir/app/data/models/city_model.dart';
import 'package:app_ongkir/app/data/models/province_model.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ONGKOS KIRIM'),
          centerTitle: true,
          primary: true,
          backgroundColor: Colors.amber,
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            DropdownSearch<Province>(
              dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(),
                      label: Text(
                        "Pilih provinsi",
                      ),
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder())),
              asyncItems: (text) async {
                var response = await Dio().get(
                    "https://api.rajaongkir.com/starter/province",
                    queryParameters: {
                      'key': "bebae5a1d91ae56697fa5a1cd414b60c"
                    });
                return Province.fromJsonList(
                    response.data["rajaongkir"]["results"]);
              },
              onChanged: (value) {
                controller.provinsiAsalId.value = value?.provinceId ?? "0";
              },
              popupProps: PopupProps.menu(showSearchBox: true),
            ),
            SizedBox(
              height: 20,
            ),
            DropdownSearch<City>(
              dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(),
                      label: Text(
                        "Pilih kota/kabupaten",
                      ),
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder())),
              asyncItems: (text) async {
                var response = await Dio().get(
                    "https://api.rajaongkir.com/starter/city?province=${controller.provinsiAsalId}",
                    queryParameters: {
                      'key': "bebae5a1d91ae56697fa5a1cd414b60c"
                    });
                return City.fromJsonList(
                    response.data["rajaongkir"]["results"]);
              },
              popupProps: PopupProps.menu(
                showSearchBox: true,
                itemBuilder: (context, item, isSelected) {
                  return ListTile(title: Text("${item.type} ${item.cityName}"));
                },
              ),
              onChanged: (value) {
                controller.cityAsalId.value = value?.cityId ?? "0";
              },
            ),
            SizedBox(
              height: 20,
            ),
            DropdownSearch<Province>(
              dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(),
                      label: Text(
                        "Pilih tujuan provinsi",
                      ),
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder())),
              asyncItems: (text) async {
                var response = await Dio().get(
                    "https://api.rajaongkir.com/starter/province",
                    queryParameters: {
                      'key': "bebae5a1d91ae56697fa5a1cd414b60c"
                    });
                return Province.fromJsonList(
                    response.data["rajaongkir"]["results"]);
              },
              onChanged: (value) {
                controller.provinsiTujuanlId.value = value?.provinceId ?? "0";
              },
              popupProps: PopupProps.menu(showSearchBox: true),
            ),
            SizedBox(
              height: 20,
            ),
            DropdownSearch<City>(
              dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(),
                      label: Text(
                        "Pilih tujuan kota/kabupaten",
                      ),
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder())),
              asyncItems: (text) async {
                var response = await Dio().get(
                    "https://api.rajaongkir.com/starter/city?province=${controller.provinsiTujuanlId}",
                    queryParameters: {
                      'key': "bebae5a1d91ae56697fa5a1cd414b60c"
                    });
                return City.fromJsonList(
                    response.data["rajaongkir"]["results"]);
              },
              popupProps: PopupProps.menu(
                showSearchBox: true,
                itemBuilder: (context, item, isSelected) {
                  return ListTile(title: Text("${item.type} ${item.cityName}"));
                },
              ),
              onChanged: (value) {
                controller.cityTujuanId.value = value?.cityId ?? "0";
              },
            ),
            SizedBox(
              height: 20,
            ),
            DropdownSearch<Map<String, dynamic>>(
              items: [
                {
                  "code": "jne",
                  "name": "JNE",
                },
                {
                  "code": "pos",
                  "name": "POS Indonesia",
                },
                {
                  "code": "tiki",
                  "name": "TIKI",
                },
              ],
              popupProps: PopupProps.menu(
                showSearchBox: true,
                itemBuilder: (context, item, isSelected) {
                  return ListTile(
                    title: Text("${item['name']}"),
                  );
                },
              ),
              dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(),
                      label: Text(
                        "Pilih kurir",
                      ),
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder())),
              dropdownBuilder: (context, selectedItem) =>
                  Text("${selectedItem?['name'] ?? "Wajib pilih kurir"}"),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){}, 
              child: Text("CEK ONGKOS KIRIM"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.white
              ))
          ],
        ));
  }
}
