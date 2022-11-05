import 'package:flutter/material.dart';
import 'package:frontend/src/environment/environment.dart';
import 'package:frontend/src/models/universityModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class UniversityProviders extends GetConnect{
  
  String url = Environment.API_URL;

 Future<List<University>> getAll() async {
      Response response = await get('$url',); 


      if(response.statusCode==401){
          Get.snackbar("Error", "No tiene permisos");
          return [];
      }
      if(response.statusCode==null){
        Get.snackbar("Error", "Por favor intente mas tarde");
        return [];
      }
      List<University> universities =University.fromJsonList(response.body);
      return universities;
    
      
    }



 

}