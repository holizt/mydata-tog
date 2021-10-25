import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import '../models/profil_model.dart';
import '../utilities/app_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final documentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(documentDir.path);
  Hive.registerAdapter(ProfilModelAdapter());
  await Hive.openBox<ProfilModel>('profil');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyData',
      getPages: AppPages.routes,
      initialRoute: AppPages.initial,
    );
  }
}
