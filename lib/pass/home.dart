import 'package:flutter/material.dart';
import 'restaurant.dart';
import 'main_drawer.dart';
// import 'pages/Sceen.dart';
import 'Forder.dart';
class HomePages extends StatelessWidget {
  const HomePages({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: Color.fromRGBO(38, 24, 52, 2),
      title: Text('Welcome') ,
      // backgroundColor: Colors.red,
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('ยินดีต้อนรับ',
          style: TextStyle(fontSize: 30.0, color: Colors.grey,fontStyle: FontStyle.italic),
          
          ),
          
          ClipOval(
            child:Image.asset('assets/images/IMG.jpg', 
            width: 250,height: 250,),
             ),
            
            OutlinedButton(
              child: const Text('ยืนยัน'),
              onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (context){
               //restaurant
               return ResPages();
             }));
              }
          ),
          OutlinedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              // forder.dart
              return Carorder();
            }));
          }, child: Text('Order Car'),),
        ],
      ),
    ),
    );
  }
}