import 'package:flutter/material.dart';
import 'package:vit_hack_certificate/constants.dart';
import 'package:file_picker/file_picker.dart';
import '../constants.dart';
import 'dart:io';
import 'package:excel/excel.dart';
class UploadFileOption extends StatefulWidget {
  @override
  _UploadFileOptionState createState() => _UploadFileOptionState();
}
List template=[
  "certificate1.jpg",
  "certificate2.jpg"
];

String selected;
String image_path;//contains image which will be the template
int i;
String custom_temp=null;
String sheet;
class _UploadFileOptionState extends State<UploadFileOption> {
  List name=[];
  List project=[];
  List position=[];
  List select=List.filled(template.length,false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'HACK_CERTIFICATE',
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
        backgroundColor: kLoginButtonColour,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
            Text(
              "Select a template",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
            Container(
              height: MediaQuery.of(context).size.height*0.25,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: template.length,
                  itemBuilder: (context,index){
                    return GestureDetector(
                      onTap: (){//to detect when card is selected
                        setState(() {
                          select[index]=!select[index];
                          custom_temp=null;
                          if(select[index])
                            selected=template[index];//contains selected image
                          else if(select[index]==false)
                            selected=null;
                          for(i=0;i<select.length;i++)
                            {
                              if(i==index)//to ensure only one template is selected
                                  continue;
                              select[i]=false;
                            }
                          print(select[index]);
                          print(selected);
                        });
                      },
                      child:Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,//to display the templates
                        child: Image.asset(
                          'images/${template[index]}',
                          fit: BoxFit.fill,
                        ),
                        shape: select[index]
                            ? new RoundedRectangleBorder(
                            side: new BorderSide(color: Colors.blue, width: 2.0),
                            borderRadius: BorderRadius.circular(4.0))
                            : new RoundedRectangleBorder(
                            side: new BorderSide(color: Colors.white, width: 2.0),
                            borderRadius: BorderRadius.circular(4.0)),
                        elevation: 2,
                        margin: EdgeInsets.all(5),
                      )
                    );
                  }
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.06,),
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height*0.07,
                width:MediaQuery.of(context).size.width*0.8,
                child: FlatButton(
                  onPressed: () async {
                    FilePickerResult templatePath = await FilePicker.platform.pickFiles(
                        type: FileType.image,
                    );
                    setState(() {
                      selected=null;
                      for(i=0;i<select.length;i++)
                      {
                        select[i]=false;
                      }
                      custom_temp=templatePath.files.single.path;//contains the path of custom template
                    });
                    print(custom_temp);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  color: Colors.redAccent,
                  child: Container(
                    child: Text(
                      "Select custom template",
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.03,),
            custom_temp!=null?
            Container(
              height: MediaQuery.of(context).size.height*0.2,
              width: MediaQuery.of(context).size.width*0.7,
              child: Image.file(File(custom_temp)),
            )
            :Container(
              height: 0,
              width: 0,
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.03,),
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height*0.07,
                width:MediaQuery.of(context).size.width*0.8,
                child: FlatButton(
                  onPressed: () async {
                    print(selected);
                    print(custom_temp);
                    if (selected == null && custom_temp == null) {
                      print("Something");
                    }
                    else {
                      FilePickerResult sheetPath = await FilePicker.platform
                          .pickFiles(
                        type: FileType.custom,
                        allowedExtensions: ['xlsx'],
                      );
                      setState(() {
                        selected = null;
                        sheet = sheetPath.files.single
                            .path; //contains the path of excel sheet
                      });
                      print(sheet);
                      var bytes = File(sheet).readAsBytesSync();
                      var excel = Excel.decodeBytes(bytes);
                      print(excel.tables.keys);
                      for (var detail in excel.tables.keys) {
                        print(detail); //sheet name
                        print(excel.tables[detail].rows);
                        print(excel.tables[detail].maxCols);
                        print(excel.tables[detail].maxRows);
                        for (var row in excel.tables[detail].rows) {
                          name.add(row[0]); //Contains name of participants
                          project.add(row[1]); //Contains name of project
                          position.add(row[2]); //Contains position
                        }
                      }
                      print(name);
                      print(project);
                      print(position);
                      if (custom_temp == null) {
                        image_path = "images/" + selected;
                      }
                      else {
                        image_path = custom_temp;
                      }
                      print(image_path);//contains the image which will finally act as the template
                    }
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  color: Colors.redAccent,
                  child: Container(
                    child: Text(
                      "Upload excel sheet",
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
