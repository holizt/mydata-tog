import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../models/profil_model.dart';

class AppController extends GetxController {
  final _listDataProfil = <ProfilModel>[].obs;

  final _imagePicker = ImagePicker();

  var nameCtrl = TextEditingController();
  var addressCtrl = TextEditingController();
  var dateCtrl = TextEditingController();
  var weightCtrl = TextEditingController();
  var heightCtrl = TextEditingController();

  var isActivBtn = true.obs;
  var imageGalery;

  final _timerMaxSecond = 60.obs;
  final _currentSecond = 0.obs;

  String get timerTxt =>
      '${((_timerMaxSecond.value - _currentSecond.value) ~/ 60).toString().padLeft(2, '0')}: ${((_timerMaxSecond.value - _currentSecond.value) % 60).toString().padLeft(2, '0')}';

  List<ProfilModel> get listData => _listDataProfil;

  @override
  void onInit() {
    _readDataProfil();
    super.onInit();
  }

  Future<void> pickImageGalery() async {
    var source = ImageSource.gallery;
    XFile? image =
        await _imagePicker.pickImage(source: source, imageQuality: 50);
    imageGalery = File(image!.path);
    update();
  }

  void startTimer() {
    var duration = const Duration(seconds: 1);
    Timer.periodic(duration, (timer) {
      _currentSecond.value = timer.tick;
      if (timer.tick >= _timerMaxSecond.value) {
        isActivBtn.value = false;
        timer.cancel();
      }
    });
  }

  Future<void> selectDate(BuildContext context) async {
    var picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2035));

    if (picked != null) {
      var formatDate = DateFormat('dd-MM-yyyy').format(picked);
      dateCtrl.text = formatDate;
    }
  }

  void _readDataProfil() {
    var box = Hive.box<ProfilModel>('profil');
    _listDataProfil.assignAll(box.values.toList());
  }

  void removeAtDataProfil(int index) {
    var box = Hive.box<ProfilModel>('profil');
    box.deleteAt(index);
    _listDataProfil.removeAt(index);

    printInfo(info: 'remove data $index');
  }

  void addData() {
    if ((nameCtrl.text != '') &&
        (dateCtrl.text != '') &&
        (addressCtrl.text != '') &&
        (heightCtrl.text != '') &&
        (weightCtrl.text != '') &&
        (imageGalery != null)) {
      _saveDataProfil();
    } else {
      Get.snackbar(
        'Wait !!',
        'Data cannot be empty',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
  }

  void _saveDataProfil() {
    final mName = nameCtrl.text;
    final mAddress = addressCtrl.text;
    final mDate = dateCtrl.text;
    final mHeight = heightCtrl.text;
    final mWeight = weightCtrl.text;

    var strImage = imageGalery.toString();

    var data = ProfilModel(
        name: mName.trim(),
        address: mAddress.trim(),
        date: DateFormat('dd-MM-yyyy').parse(mDate),
        height: double.parse(mHeight),
        weight: double.parse(mWeight),
        imgPath: strImage.substring(7, strImage.length - 1));

    var box = Hive.box<ProfilModel>('profil');
    box.add(data);

    _actionSavaDataSuccess();

    printInfo(info: 'save data $data');

    _readDataProfil();
  }

  void _actionSavaDataSuccess() {
    nameCtrl.text = '';
    dateCtrl.text = '';
    addressCtrl.text = '';
    heightCtrl.text = '';
    weightCtrl.text = '';

    Get.snackbar(
      'Success !!',
      'Save Data profil',
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }
}
