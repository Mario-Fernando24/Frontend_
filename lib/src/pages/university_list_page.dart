import 'dart:async';
import 'package:flutter/material.dart';
import 'package:frontend/src/controllers/universityController.dart';
import 'package:frontend/src/models/universityModel.dart';
import 'package:get/get.dart';


class UniversityListPage extends StatefulWidget {
  @override
  State<UniversityListPage> createState() => _UniversityListPageState();
}

class _UniversityListPageState extends State<UniversityListPage> {
     UniversityController _universityController = Get.put(UniversityController());


  @override
  Widget build(BuildContext context) {

   
        return Scaffold( 
            appBar: AppBar(actions: [
              Padding(
                padding: const EdgeInsets.only(right: 140),
                child: Text("Prueba Tyba",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize:30 ),),
              ),
            ]),
        body: ListView(
         children: [
            FutureBuilder(
              future: _universityController.getUniversity(),
              builder: (context, AsyncSnapshot<List<University>> snapshot) {
                return ListView.builder(
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (_, index) {
                    return _cardApp(snapshot.data![index], context);
                  },
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                );
              }
            ),
        ],
      )
    );
    
  }




    Widget _cardApp(University university, BuildContext context) {
    return Padding(
      
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
      onTap: ()=> _universityController.openBottonSheet(university, context),

        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 0,
                  spreadRadius: 0,
                  color: Color.fromRGBO(191, 191, 191, 1),
                )
              ]),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                Expanded(
                  child: Container(
                    // width: 200,
                    margin: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              university.name??'',
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Text(
                           university.country??'',
                          maxLines: 2,
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          (  university.alphaTwoCode??''),
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                              fontSize: 13),
                        ),
                        Expanded(child: Container()),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            // alignment: Alignment.bottomRight,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(24)),
                              color: Color.fromARGB(255, 56, 150, 227),
                            ),
                            child: Text("Detalles"),
                          ),
                        )
                      ],
                      // ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    
  }

 





  
}
