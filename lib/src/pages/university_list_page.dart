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
    final orientacion= MediaQuery.of(context).orientation;

    final ButtonStyle endExperienceBtnStyle = ElevatedButton.styleFrom(
        textStyle: TextStyle(fontSize: 14),
        minimumSize: Size(50, 36),
        primary: Color.fromRGBO(172, 65, 49, 1));
        return Scaffold( 
        primary:true ,

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
                //  Container(
                //    width: 100,
                //    child: FadeInImage(
                //   image: rickandmorty.image!=null ?
                //   NetworkImage(rickandmorty.image ?? '')
                //   : AssetImage('assets/img/no-image.png') as ImageProvider,
                //   fit: BoxFit.cover,
                //   fadeInDuration: Duration(milliseconds: 50),
                //   //en caso de que no venga ninguna imagen
                //   placeholder: AssetImage('assets/img/no-image.png'), 
                //   ),
                //  ),
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
                              university.alphaTwoCode??'',
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
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
                              color: Color.fromARGB(255, 68, 172, 108),
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
