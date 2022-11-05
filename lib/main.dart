import 'package:flutter/material.dart';
import 'package:frontend/src/pages/university_list_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
  //inicializamos storage
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "tyba",
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: ()=>UniversityListPage()),  
      ],
      navigatorKey: Get.key,
    );
  }
}