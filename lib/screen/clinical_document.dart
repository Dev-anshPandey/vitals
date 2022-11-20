//import 'dart:html';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:vitals/widget/color.dart';

//var image;
const List<String> list = <String>['Prescription', 'Report', 'Scan', 'Advice','Diet Chart'];
String date = DateFormat('kk:mm').format(DateTime.now());
String datee = DateFormat('d MMM').format(DateTime.now());

class CD extends StatefulWidget {
  @override
  State<CD> createState() => _CDState();
}

class _CDState extends State<CD> {
    File? image;

  Future PickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemporary = File(image.path);
    setState(() {
       this.image = imageTemporary;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mycolor['bgColor'],
      floatingActionButton:GestureDetector(
        onTap: PickImage,
        child: CircleAvatar(
                      backgroundColor: mycolor['gradientColor'],
                      radius: 40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            size: 40,
                            color: Colors.black,
                          ),
                         
                        ],
                      ),
                    ),
      ),
      body: SafeArea(
        child: Column(
          children: [
             image==null ?GestureDetector(
              onTap: PickImage,
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.30,
                    left: MediaQuery.of(context).size.width * 0.02),
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: mycolor['gradientColor'],
                    radius: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.cloud_upload_outlined,
                          size: 80,
                          color: Colors.black,
                        ),
                        Text(
                          "Upload documents",
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ):Text(''), 
            
                        image!=null ? 
            Padding(
              padding: const EdgeInsets.only(top:10,left: 8.0,right: 8),
              child: Card(
                child: Container(
                  height: 200,
                  width: 400,
                  child: 
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.file(image!,cacheHeight: 200,cacheWidth: 200, ),
                      //SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                            Padding(
                              padding: const EdgeInsets.only(left:8.0),
                              child: DropdownButtonExample(),
                            ),
                            SizedBox(height: 30,),
                            Padding(
                              padding: const EdgeInsets.only(left:8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                     Icon(Icons.timelapse,color: Colors.grey,),Text(date,style: TextStyle(color: Colors.grey),)
                                ],),),
                                SizedBox(
                                  height: 10,
                                ),
                                   Padding(
                              padding: const EdgeInsets.only(left:8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                     Icon(Icons.calendar_month,color: Colors.grey,),Text(datee,style: TextStyle(color: Colors.grey),)
                                ],),),
                          SizedBox(
                            height: 22,
                          ),
                          Card(child: Container(
                            height: 30,
                            width: 130,
                            color: mycolor['gradientColor'],
                          child: Center(child: Text("Convert to pdf")),
                  ),
              ),]
            ) ])))):Text("")
          ],
        ),
      ),
    );
  }
}


class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon:  Icon(Icons.arrow_drop_down,size:30,color: mycolor['textColor'],),
      elevation: 16,
      style:  TextStyle(color: mycolor['textColor']),
      underline: Container(
        height: 2,
        color: mycolor['gradientColor'],
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
