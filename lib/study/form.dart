
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:typed_data';
import 'dart:convert';

class AppForm extends StatefulWidget {
  // const AppForm({Key? key}) : super(key: key);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController;
  TextEditingController descriptionController;
  TextEditingController linkController;
  TextEditingController numberController;
  String img = "";
  final String title = "Upload Image Demo";

  AppForm({required this.formKey , required this.nameController, required this.descriptionController, required this.linkController, required this.numberController, required this.img});

  @override
  _AppFormState createState() => _AppFormState();
}

class _AppFormState extends State<AppForm> {

  File? _image;
  final _picker = ImagePicker();
  String base64string = '';

  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
    await _picker.pickImage(source: ImageSource.gallery);
    widget.img = 'aaa';
    if (pickedImage != null) {
      setState((){
        _image = File(pickedImage.path);
        // widget.img = 'aaa';
        /*     File(pickedImage.path).readAsString(encoding:utf8 ).then((String contents) {
          print(contents);
        });*/
        // print(pickedImage.path);

      });
      File imagefile = File(pickedImage.path);
      Uint8List imagebytes = await imagefile.readAsBytes();
      base64string = base64.encode(imagebytes);
      setState(() {

      });
      // AppForm _appForm = new AppForm(nameController: widget.nameController,descriptionController: widget.descriptionController,linkController: widget.linkController,numberController: widget.numberController,img: base64string, formKey: widget.formKey,);
      // _appForm.img = "aaaas"
      // print( _appForm.img);
      // widget.img = base64string;


    }
  }



  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      autovalidateMode: AutovalidateMode.always,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: widget.nameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: "Name"),
              validator: (value){
                if(value.toString().length < 3)
                  return "Please input valid name";
                return null;
              },
            ),
            TextFormField(
              controller: widget.descriptionController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: "Description"),
              // validator: _validateAge,
            ),
            TextFormField(
              controller: widget.linkController,
              keyboardType: TextInputType.url,
              decoration: InputDecoration(labelText: "Link"),
              validator: (value){
                String link = value.toString();
                bool validLink = Uri.tryParse(link)?.hasAbsolutePath ?? false;
                if(!validLink)
                  return "Please input valid Link Url";
                return null;
              },

            ),

            TextFormField(
              controller: widget.numberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(labelText: "Phone Number"),
              validator: (value){
                value = value.toString();
                String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                RegExp regExp = new RegExp(patttern);
                if (value.length == 0) {
                  return 'Please enter mobile number';
                }
                else if (!regExp.hasMatch(value)) {
                  return 'Please enter valid mobile number';
                }
                return null;
              },
            ),
            const SizedBox(height: 35),
            ElevatedButton(
              child: const Text('Select An Image'),
              onPressed: _openImagePicker,

            ),
            const SizedBox(height: 35),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 300,
              color: Colors.grey[300],
              child: _image != null
                  ? Image.file(_image!, fit: BoxFit.cover)
                  : const Text('Please select an image'),
            ),

          ],
        ),
      ),

    );
  }
}
