import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontend/src/controllers/universityController.dart';
import 'package:frontend/src/models/universityModel.dart';
import 'package:get/get.dart';

class DetailUniversityPage extends StatefulWidget {
  
   University? university;

    DetailUniversityPage({@required this.university}){}

  @override
  State<DetailUniversityPage> createState() => _DetailUniversityPageState();
}

class _DetailUniversityPageState extends State<DetailUniversityPage> {
     UniversityController _universityController = Get.put(UniversityController());

   String noImagen="https://images.wondershare.com/recoverit/article/2020/05/cant-open-png-file-0.jpg";

  @override
  Widget build(BuildContext context) {

    return   Scaffold(
   bottomNavigationBar: Container(
        height: 100,
        ),
      body: Stack(
        children: [
              GetBuilder<UniversityController>(
                    builder: (value)=>  
           _cardImage(context, _universityController.imageFile1)),
           _textNameUniversity(),
           _textDescription(),
        
          ],
       )
    );
  }

Widget _cardImage(BuildContext context,File? imageFile){

  return  Padding(
    padding: const EdgeInsets.only(top: 60.0,left: 60.0, right: 60.0),
    child: GestureDetector(
        
          onTap: ()=>_universityController.showAlertDialog(context),
          child:  Card(
          elevation: 3,
          child: Container(
            height:  MediaQuery.of(context).size.height*0.3,
            width:  MediaQuery.of(context).size.width*0.8,
            
            child: imageFile!=null? 
              ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),

                child: Image.file(
                  imageFile,
                  fit: BoxFit.cover,
                   height: MediaQuery.of(context).size.height*0.8,
                width: 80.0,
                ),
              )
            :
            ClipRRect(
                  borderRadius: BorderRadius.circular(70.0),

              child: Image(
                image:  AssetImage('assets/img/no-image.png'),
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height*0.8,
                width: 80.0,
              ),
            )
          ),   
        ),
    ),
  );

}

  
  Widget _textNameUniversity(){
    return Padding(
    padding: const EdgeInsets.only(top: 0.0,left: 100.0, right: 60.0),

      child: Container(
        alignment: Alignment.centerLeft,
        child: Text(widget.university!.name!,
         style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: Colors.black),),
      ),
    );
  }

   Widget _textDescription(){
    return Padding(
    padding: const EdgeInsets.fromLTRB(40, 390, 16, 16),
      child: Container(
        alignment: Alignment.centerLeft,
          child: Column(
          children: [
            Text("${widget.university!.country!}",style: TextStyle(fontSize: 15)),
            Text("${widget.university!.alphaTwoCode!}",style: TextStyle(fontSize: 15)),
            Text("Dominio ${widget.university!.domains!.first}",style: TextStyle(fontSize: 15)),
            Text("Pagina web ${widget.university!.webPages!.first}",style: TextStyle(fontSize: 15))

          ],
        ),
      ),
    );
  }

}