
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'form.dart';
import 'studentPage.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:typed_data';
import 'dart:convert';
import 'studentData.dart';

class AddData extends StatefulWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  final formKey = GlobalKey<FormState>();

  // Handles text onchange
  TextEditingController nameController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
  TextEditingController linkController = new TextEditingController();
  TextEditingController numberController = new TextEditingController();
  String place = "Sea";
  String img = "";


  File? _image;
  final _picker = ImagePicker();
  String base64string = '';

  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
    await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState((){
        _image = File(pickedImage.path);
        /*     File(pickedImage.path).readAsString(encoding:utf8 ).then((String contents) {
          print(contents);
        });*/
        // print(pickedImage.path);

      });
      File imagefile = File(pickedImage.path);
      Uint8List imagebytes = await imagefile.readAsBytes();
      base64string = base64.encode(imagebytes);
      img = base64string;

    }
  }


  Future createStudent() async{
    String name = nameController.text;
    String description = descriptionController.text;
    String link = linkController.text;
    String number = numberController.text;
    String plc = place;
    String image = img;

    return await http.post(
        Uri.parse("http://localhost:8080/flutter_api/create.php"),
        body: {
          "name" : name,
          "description": description,
          "link" : link,
          "number": number,
          "place" : plc,
          "image": image
        }
    );
  }
  void alertText(context, text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4)
          ),
          child: Container(
            height: 200,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.white70,
                    child: Icon(Icons.warning_sharp, size: 60,),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.redAccent,
                    child: SizedBox.expand(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(text,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            RaisedButton(
                              color: Colors.white,
                              child: Text('Okay'),
                              onPressed: ()=> {
                                Navigator.of(context).pop()
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  bool nameValidate(name){
    if(name.length < 3)
      return false;
    return true;
  }

  bool linkValidate(link){
    bool validLink = Uri.tryParse(link)?.hasAbsolutePath ?? false;
    if(!validLink)
      return false;
    return true;
  }

  bool numberValidate(number){
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(patttern);
    if (!regExp.hasMatch(number)) {
      return false;
    }
    return true;
  }

  void _onConfirm(context) async{
    bool _nameValidate = nameValidate(nameController.text);
    bool _linkValidate = linkValidate(linkController.text);
    bool _numberValidate = numberValidate(numberController.text);

    if(nameController.text.length <= 0 || linkController.text.length <= 0 || numberController.text.length <= 0 || _image == null){
      alertText(context, "????????????????????????????????????????????????????????????????????????????????????");
      return;
    }
    else if(!_nameValidate){
      alertText(context, "?????????????????????????????????????????????????????????????????????");
    }
    else if(!_linkValidate){
      alertText(context, "??????????????????????????? Link ??????????????????????????????");
    }
    else if(!_numberValidate){
      alertText(context, "??????????????????????????????????????????????????????????????????????????????????????????????????????");
    }
    else{
      await createStudent();
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => StudentPage()),(Route<dynamic> route) => false,);
    }
  }

  // List of items in our dropdown menu
  var items = [
    'Sea',
    'Pagoda',
    'Island',
    'Market',
    'Farm',
    'Resort',
    'Historical Place',
  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _buildAppBar(),
      bottomNavigationBar: _buildBottomApp(context),
      body: _buildBody()
    );
  }
  _buildAppBar(){
    return AppBar(
      title: Text("??????????????????????????????????????????????????????????????????"),
      backgroundColor: Colors.red.withOpacity(0.7),
    );
  }

  _buildBottomApp(context){
    return BottomAppBar(
      child: RaisedButton(
        child: Text("??????????????????"),
        color: Colors.red.withOpacity(0.7),
        textColor: Colors.white,
        onPressed: (){
          _onConfirm(context);
        },
      ),
    );
  }

  _buildBody(){
    return Container(
      color: Colors.white,
      padding:  EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextFormField(
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: "????????????")
            ),
            TextFormField(
              controller: descriptionController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: "??????????????????????????????"),
            ),
            TextFormField(
              controller: linkController,
              keyboardType: TextInputType.url,
              decoration: InputDecoration(labelText: "Link"),
            ),
            TextFormField(
              controller: numberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(labelText: "?????????????????????????????????????????????"),

            ),
            const SizedBox(height: 10),
            Container(
              child:DropdownButton(
                // hint:Text("Select item"),
                value: place,
                items: items.map((String items) {
                  return DropdownMenuItem(
                    child: Text(items),
                    value: items,
                  );
                }).toList(),
                onChanged:(String? newValue) {
                  setState(() {
                    place = newValue!;
                  });
                },
                // disabledHint:Text("Place"),
                elevation: 2,
                style:TextStyle(color:Colors.green, fontSize: 16),
                icon: Icon(Icons.arrow_drop_down_circle),
                iconDisabledColor: Colors.red,
                iconEnabledColor: Colors.green,
                isExpanded: true,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text('???????????????????????????????????????'),
              onPressed: _openImagePicker,

            ),
            const SizedBox(height: 10),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 300,
              color: Colors.grey[300],
              child: _image != null
                  ? Image.file(_image!, fit: BoxFit.cover)
                  : const Text('???????????????????????????????????????'),
            )
          ],
        ),
      ),
    );
  }
}


