import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:save_in_gallery/save_in_gallery.dart';
import 'package:vit_hack_certificate/constants.dart';
import 'package:vit_hack_certificate/screens/upload_file.dart';
import 'package:vit_hack_certificate/screens/utils.dart';
import 'package:vit_hack_certificate/screens/widget_to_image.dart';
import 'package:gallery_saver/gallery_saver.dart';

import '../constants.dart';

class CertificateDisplay extends StatefulWidget {
  CertificateDisplay({this.name, this.project, this.position});

  final List<String> name;
  final List<String> project;
  final List<String> position;

  @override
  _CertificateDisplayState createState() => _CertificateDisplayState();
}

class _CertificateDisplayState extends State<CertificateDisplay> {
  List<GlobalKey> keys = <GlobalKey>[];

  List<Uint8List> bytes = [];

  final _imageSaver = ImageSaver();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          kAppName,
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
        backgroundColor: kLoginButtonColour,
      ),
      backgroundColor: kAppBackgroundColour,
      body: Stack(
        children: [
          ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: widget.name.length,
            itemBuilder: (BuildContext context, int index) {
              if (index != 0) {
                return WidgetToImage(
                  builder: (key) {
                    this.keys.add(key);
                    return CompleteCertificateDetails(
                        name: widget.name[index],
                        project: widget.project[index],
                        position: widget.position[index]);
                  },
                );
              } else {
                return Container();
              }
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
          Positioned(
            bottom: 0,
            right: 2.0,
            left: 2.0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.7,
              color: kLoginButtonColour,
              child: FlatButton(
                child: Text(
                  'Create Certificate',
                  style: TextStyle(fontSize: 30.0, color: Colors.white),
                ),
                onPressed: () async {
                  Directory appDocDir =
                      await getApplicationDocumentsDirectory();
                  String appDocPath = appDocDir.path;
                  print(appDocPath);
                  String fullPath = '$appDocPath/abcd.png';
                  print(fullPath);
                  print(keys);
                  File file = File(fullPath);
                  for (int i = 1; i < widget.name.length; i++) {
                    final byte = await Utils.capture(keys[i - 1]);
                    await file.writeAsBytes(byte);
                    print(file.path);
                    print("::::::::\n\n\n\n\n :::::::$byte");
                    final result = await ImageGallerySaver.saveImage(byte);
                    //final res = await _imageSaver.saveImage(imageBytes: byte);
                    //GallerySaver.saveImage(byte);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CompleteCertificateDetails extends StatelessWidget {
  CompleteCertificateDetails(
      {this.name = 'NAN', this.project = 'NAN', this.position = 'NAN'});

  final String name;
  final String project;
  final String position;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.32,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Stack(
        children: [
          Center(
            child: Image.file(
              File(custom_temp),
              fit: BoxFit.cover,
            ),
          ),
          Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$name',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'has been Awarded This Certificate for the project on $project',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black, fontStyle: FontStyle.italic),
                ),
              ),
              Text(
                'For the Position : $position',
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.black, fontStyle: FontStyle.italic),
              )
            ],
          ))
        ],
      ),
    );
  }
}
