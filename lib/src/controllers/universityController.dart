import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontend/src/models/universityModel.dart';
import 'package:frontend/src/pages/detail_university_page.dart';
import 'package:frontend/src/providers/universityProviders.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class UniversityController extends GetxController{

  UniversityProviders  rickProviders = UniversityProviders();
  TextEditingController numberStudentController = TextEditingController();

  ImagePicker picker = ImagePicker();
  //escoger .io
  File? imageFile1;

     UniversityController() {
        getUniversity();
      }



      void add(){
        String numberPhone=numberStudentController.text.toString();
          if(isValidForm(numberPhone)){

          }else{
              Get.snackbar("Formulario no valido","Campos vacios");
          }
      }


       bool isValidForm(String number){
         
            if(number.isEmpty){    
              Get.snackbar("Formulario no valido","Debes ingresar el email");
              return false;
            }else  if(imageFile1==null){
              Get.snackbar("Por favor","Imagen es obligatoria");
              return false;
            }
            return true;
       }

      

      Future<List<University>> getUniversity() async {
          return await rickProviders.getAll();
      }

      void openBottonSheet(University university, BuildContext context){
              imageFile1=null;
              showMaterialModalBottomSheet(
                context: context,
                builder: (contex)=>DetailUniversityPage(
                  university: university)
              );
        }

    void showAlertDialog(BuildContext context){

      Widget galleryButton = ElevatedButton(
        onPressed: (){
        
          //abrimos la galeria
          selectImage(ImageSource.gallery);
            Get.back();
            
        }, 
        child: Text("Galeria", style: TextStyle(color: Colors.black))
        );

      Widget cameraButton = ElevatedButton(
        onPressed: (){
          Get.back();
          //abrimos la camara del dispositivo
          selectImage(ImageSource.camera);
        }, 
        child: Text("Camara", style: TextStyle(color: Colors.black))
        );

        AlertDialog alertDialog = AlertDialog(
          title: Text('Selecciona una opción'),
          actions: [
            galleryButton,
            cameraButton
          ],
        );

          showDialog(context: context, builder: (BuildContext context){
          return alertDialog;
        });
    }


      Future selectImage(ImageSource imageSource) async{

        XFile? imagen = await picker.pickImage(source: imageSource);
        if(imagen!=null){
          //le paso la ruta de la imagen
          imageFile1 = File(imagen.path); 
          update();
     }
     update();
    }

   
}