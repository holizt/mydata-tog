import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/app_controller.dart';
import '../widgets/profil_item.dart';
import '../utilities/app_routes.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final _controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyData'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.profil),
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Obx(
          () => (_controller.listData.isEmpty)
              ? _buildListEmptyWidget(context)
              : _buildListProfilWidget(),
        ),
      ),
    );
  }

  Widget _buildListEmptyWidget(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'No data added yet!',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: size.height * 0.6,
            child: Image.asset(
              'assets/images/waiting.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListProfilWidget() {
    return ListView.builder(
      itemCount: _controller.listData.length,
      itemBuilder: (_, index) {
        final data = _controller.listData[index];
        var dateBirth = DateFormat('dd-MM-yyyy').format(data.date);
        return ProfilItem(
          onTap: () => _controller.removeAtDataProfil(index),
          name: data.name,
          address: data.address,
          date: dateBirth,
          height: data.height.toString(),
          weight: data.weight.toString(),
          imgPath: File(data.imgPath),
        );
      },
    );
  }
}
