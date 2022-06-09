import 'package:flutter/material.dart';
import 'home.dart';
import 'Forder.dart';
import 'restaurant.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: ListView(
        children: [
          ClipOval(child: Image.asset('assets/images/IMG.jpg',width: 100,height: 100,),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: (){Navigator.push(context, MaterialPageRoute(
              builder: (context) => HomePages())
              );
              },
          ),
          ListTile(
            leading: Icon(Icons.car_repair),
            title: Text('Odercars'),
            onTap: () {
              Navigator.push(
                context, MaterialPageRoute(
                builder: (context) => Carorder()));
            },
          ),
        ],
      ),
    );
  }
  
}