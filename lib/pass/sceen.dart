// import 'package:email_validator/email_validator.dart';
// import 'package:flutter/material.dart';
// import 'home.dart';
// import 'restaurant.dart';
//
// class EditPage extends StatefulWidget {
//   final String name, email;
//   final int id;
//
//   EditPage(
//       {Key? key, required this.name, required this.email, required this.id})
//       : super(key: key);
//
//   @override
//   State<EditPage> createState() => _EditPageState();
// }
//
// class _EditPageState extends State<EditPage> {
//   final TextEditingController _nameCtrl = TextEditingController();
//   final TextEditingController _emailCtrl = TextEditingController();
//
//   Future<void> _updateUser(int id) async {
//     await SQLHelper.updateUser(id, _nameCtrl.text, _emailCtrl.text);
//   }
//
//   @override
//   void initState() {
//     _nameCtrl.text = widget.name;
//     _emailCtrl.text = widget.email;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Edit Page'),
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(20.0),
//         width: double.infinity,
//         height: 300,
//         child: Column(
//           children: [
//             TextFormField(
//               controller: _nameCtrl,
//               decoration: const InputDecoration(hintText: 'Name'),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please input Name!!!';
//                 }
//               },
//             ),
//             TextFormField(
//               controller: _emailCtrl,
//               decoration: const InputDecoration(labelText: 'Email'),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please input Email!!!';
//                 } else {
//                   final bool isValid = EmailValidator.validate(value);
//                   if (!isValid) {
//                     return 'Email Wrong!!!';
//                   } else {
//                     return null;
//                   }
//                 }
//               },
//             ),
//             OutlinedButton(
//               child: const Text('Update'),
//               onPressed: () {
//                 _updateUser(widget.id);
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => HomePages
//                     (),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }