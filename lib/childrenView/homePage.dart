import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  var _imgPath;
  final ImagePicker picker = new ImagePicker();

  Widget _ImageView(imgPath){
    if(imgPath == null){
      return Image.asset("images/common/抗疫必胜.png",
        width: MediaQuery.of(context).size.width - 10,);
    }else{
      return Image.file(imgPath,
        width: MediaQuery.of(context).size.width - 50,);
    }
  }

  Future _takePhoto() async {
    var image = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if(image != null){
        _imgPath = File(image.path);
        _uploadData(image.path);
        print(image.path);
      }
    });
  }

  _uploadData(imageFile) async{
    var dir = imageFile.toString().substring(42);
    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(imageFile,filename: dir)
    });
    var respoins = await Dio().post("http://192.168.1.11:8091/znpp/file",data: formData);
    print(respoins);
    Image(
      image: NetworkImage(),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('智农拍拍'),),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "主机IP地址",
                    hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.4),),
                  ),
                ),
              ),
              Container(
                child: _ImageView(_imgPath),
              ),
              Container(
                padding: EdgeInsets.only(top: 20.0),
                width: MediaQuery.of(context).size.width - 30,
                child: ElevatedButton(
                    onPressed: _takePhoto,
                    child: Text("拍照识别")),
              )
            ],
          ),
        ],
      )
    );
  }
}
