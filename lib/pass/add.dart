// import 'package:email_validator/email_validator.dart';
// import 'package:flutter/material.dart';
// import 'restaurant.dart';
// class AddDataPage extends StatefulWidget {
//   const AddDataPage({Key? key, id, name, email}) : super(key: key);
//
//   @override
//   _AddDataPageState createState() => _AddDataPageState();
// }
//
// class _AddDataPageState extends State<AddDataPage> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _nameCtrl = TextEditingController();
//   final TextEditingController _emailCtrl = TextEditingController();
//  final TextEditingController _AddCtrl = TextEditingController();
//   Future<void> _addUser() async {
//     await SQLHelper.createUser(_nameCtrl.text, _emailCtrl.text,_AddCtrl);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Add Data'),
//         ),
//         body: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               children: [
//                 TextFormField(
//                   controller: _nameCtrl,
//                   decoration: const InputDecoration(labelText: 'Name'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please input Name!!!';
//                     }
//                   },
//                 ),
//                 TextFormField(
//                   controller: _emailCtrl,
//                   decoration: const InputDecoration(labelText: 'Email'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please input Email!!!';
//                     } else {
//                       final bool isValid = EmailValidator.validate(value);
//                       if (!isValid) {
//                         return 'Email Wrong!!!';
//                       } else {
//                         return null;
//                       }
//                     }
//                   },
//                 ),
//                 // TextFormField(
//                 //   controller: _AddCtrl,
//                 //   decoration: const InputDecoration(labelText: 'Address'),
//                 //   validator: (value) {
//                 //     if (value == null || value.isEmpty) {
//                 //       return 'Please input Email!!!';
//                 //     } else {
//                 //       final bool isValid = EmailValidator.validate(value);
//                 //       if (!isValid) {
//                 //         return 'Email Wrong!!!';
//                 //       } else {
//                 //         return null;
//                 //       }
//                 //     }
//                 //   },
//                 // ),
//                 OutlinedButton(
//                   child: const Text('Save'),
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       //debugPrint('Name : $_nameCtrl');
//                       //debugPrint('Email : $_emailCtrl');
//                       _addUser();
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) =>  ResPages(),
//                         ),
//                       );
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
