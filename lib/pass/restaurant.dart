import 'dart:ffi';

// import 'package:carousel_pro/carousel_pro.dart' show Carousel, DotPosition;
import 'package:flutter/material.dart';
import 'main_drawer.dart';
import 'Forder.dart';
import 'package:movie_app/pass_db/sql.dart';
import 'add.dart';
import 'package:movie_app/pass_model/carmodel.dart';


class ResPages extends StatefulWidget {
  final Car? car;

  const ResPages({Key? key, this.car}) : super(key: key);

  @override
  _ResPagesState createState() => _ResPagesState();
}

class _ResPagesState extends State<ResPages> {
    var carList = [
    {"id": 1, "name": "Bugatti Divo1", "price": 100000},
    {"id": 2, "name": "Bugatti Divo2", "price": 200000},
    {"id": 3, "name": "Bugatti Divo3", "price": 300000},
    {"id": 4, "name": "Bugatti Divo4", "price": 400000},
    {"id": 5, "name": "Bugatti Divo5", "price": 500000},
    {"id": 6, "name": "Bugatti Divo6", "price": 600000},
    {"id": 7, "name": "Bugatti Divo7", "price": 700000},
  ];

    late String price;
    late String name;

    @override
    void initState() {
      super.initState();
      price = widget.car?.price ?? '';
      name = widget.car?.name ?? '';
    }

    Future addCar() async {
      final car = Car(
        // id: id,
        name: name,
        price: price,
      );

      await CarsDatabase.instance.create(car);
    }

  @override
  Widget build(BuildContext context) {
        return Scaffold(
      backgroundColor: Color.fromRGBO(12, 21, 25, 1),
      appBar: AppBar(
        title: Text('All Cars'),
        backgroundColor: Colors.black12,

        actions: [
          IconButton(onPressed: (){
            Navigator.push(
              context, MaterialPageRoute(
              builder: (context) => Carorder()));
          },
          icon: Icon(Icons.car_repair),
          iconSize: 27,
          color: Colors.white,
          ),
        ],
        ),
    drawer: MainDrawer(),

     body:
     ListView(children: [
       Container(
         padding: EdgeInsets.all(8.0),
         child: Column(
           children: [
             SizedBox(
               width: double.infinity,
               height: 200.0,
               // child: Carousel(
               //   dotSize: 6.0,
               //   dotSpacing: 10.0,
               //   dotPosition: DotPosition.bottomCenter,
               //   images: [Image.asset('assets/images/Lambo.jpg',fit: BoxFit.fill,),
               //   Image.asset('assets/images/b1.jpg',fit: BoxFit.fill,),
               //   Image.asset('assets/images/Aston.jpg',fit: BoxFit.fill,),
               //   Image.asset('assets/images/k2.jpg',fit: BoxFit.fill,),
               //   Image.asset('assets/images/mg.jpg',fit: BoxFit.fill,),
               //   ],
               // ),
             ),
             ListTile(
                contentPadding: EdgeInsets.all(8.0),
               title: Text(carList[0]['name'].toString()),
               textColor: Color.fromARGB(255, 61, 216, 154),
               leading: Hero
               (tag: 'img1',
               child: Image.asset('assets/images/IMG.jpg',width: 100.0,height: 100.0,fit: BoxFit.cover,)),
               subtitle: Text(carList[0]['price'].toString() + "B"),
               trailing: IconButton(onPressed: (){
                 setState((){
                   this.name = carList[0]['name'].toString();
                   this.price = carList[0]['price'].toString();
                   addCar();
                 });
               }, icon: Icon(Icons.add,color: Colors.white,),
             ),
             ),
             ListTile(
               contentPadding: EdgeInsets.all(8.0),
               title: Text(carList[0]['name'].toString()),
               textColor: Color.fromARGB(255, 61, 216, 154),
               leading: Hero
                 (tag: 'img2',
                   child: Image.asset('assets/images/IMG.jpg',width: 100.0,height: 100.0,fit: BoxFit.cover,)),
               subtitle: Text(carList[0]['price'].toString() + "B"),
               trailing: IconButton(onPressed: (){
                 setState((){
                   this.name = carList[0]['name'].toString();
                   this.price = carList[0]['price'].toString();
                   addCar();
                 });
               }, icon: Icon(Icons.add,color: Colors.white,),
               ),
             ),
             ListTile(
               contentPadding: EdgeInsets.all(8.0),
               title: Text(carList[1]['name'].toString()),
               textColor: Color.fromARGB(255, 61, 216, 154),
               leading: Hero
                 (tag: 'img3',
                   child: Image.asset('assets/images/IMG.jpg',width: 100.0,height: 100.0,fit: BoxFit.cover,)),
               subtitle: Text(carList[1]['price'].toString() + "B"),
               trailing: IconButton(onPressed: (){
                 setState((){
                   this.name = carList[1]['name'].toString();
                   this.price = carList[1]['price'].toString();
                   addCar();
                 });
               }, icon: Icon(Icons.add,color: Colors.white,),
               ),
             ),
             ListTile(
               contentPadding: EdgeInsets.all(8.0),
               title: Text(carList[2]['name'].toString()),
               textColor: Color.fromARGB(255, 61, 216, 154),
               leading: Hero
                 (tag: 'img4',
                   child: Image.asset('assets/images/IMG.jpg',width: 100.0,height: 100.0,fit: BoxFit.cover,)),
               subtitle: Text(carList[2]['price'].toString() + "B"),
               trailing: IconButton(onPressed: (){
                 setState((){
                   this.name = carList[2]['name'].toString();
                   this.price = carList[2]['price'].toString();
                   addCar();
                 });
               }, icon: Icon(Icons.add,color: Colors.white,),
               ),
             ),
             ListTile(
               contentPadding: EdgeInsets.all(8.0),
               title: Text(carList[3]['name'].toString()),
               textColor: Color.fromARGB(255, 61, 216, 154),
               leading: Hero
                 (tag: 'img5',
                   child: Image.asset('assets/images/IMG.jpg',width: 100.0,height: 100.0,fit: BoxFit.cover,)),
               subtitle: Text(carList[3]['price'].toString() + "B"),
               trailing: IconButton(onPressed: (){
                 setState((){
                   this.name = carList[3]['name'].toString();
                   this.price = carList[3]['price'].toString();
                   addCar();
                 });
               }, icon: Icon(Icons.add,color: Colors.white,),
               ),
             ),
             ListTile(
               contentPadding: EdgeInsets.all(8.0),
               title: Text(carList[4]['name'].toString()),
               textColor: Color.fromARGB(255, 61, 216, 154),
               leading: Hero
                 (tag: 'img6',
                   child: Image.asset('assets/images/IMG.jpg',width: 100.0,height: 100.0,fit: BoxFit.cover,)),
               subtitle: Text(carList[4]['price'].toString() + "B"),
               trailing: IconButton(onPressed: (){
                 setState((){
                   this.name = carList[4]['name'].toString();
                   this.price = carList[4]['price'].toString();
                   addCar();
                 });
               }, icon: Icon(Icons.add,color: Colors.white,),
               ),
             ),
             ListTile(
               contentPadding: EdgeInsets.all(8.0),
               title: Text(carList[5]['name'].toString()),
               textColor: Color.fromARGB(255, 61, 216, 154),
               leading: Hero
                 (tag: 'img7',
                   child: Image.asset('assets/images/IMG.jpg',width: 100.0,height: 100.0,fit: BoxFit.cover,)),
               subtitle: Text(carList[5]['price'].toString() + "B"),
               trailing: IconButton(onPressed: (){
                 setState((){
                   this.name = carList[5]['name'].toString();
                   this.price = carList[5]['price'].toString();
                   addCar();
                 });
               }, icon: Icon(Icons.add,color: Colors.white,),
               ),
             ),
             ListTile(
               contentPadding: EdgeInsets.all(8.0),
               title: Text(carList[6]['name'].toString()),
               textColor: Color.fromARGB(255, 61, 216, 154),
               leading: Hero
                 (tag: 'img8',
                   child: Image.asset('assets/images/IMG.jpg',width: 100.0,height: 100.0,fit: BoxFit.cover,)),
               subtitle: Text(carList[6]['price'].toString() + "B"),
               trailing: IconButton(onPressed: (){
                 setState((){
                   this.name = carList[6]['name'].toString();
                   this.price = carList[6]['price'].toString();
                   addCar();
                 });
               }, icon: Icon(Icons.add,color: Colors.white,),
               ),
             ),
            //  ClipRRect(
            //    borderRadius: BorderRadius.circular(10),
            //    child: Show(),
            //  ),
            //  ListTile(
            //    contentPadding: EdgeInsets.all(8.0),
            //    title: Text('Bugatti Divo'),
            //    textColor: Color.fromARGB(255, 61, 216, 154),
            //    leading: Image.asset('assets/images/b1.jpg'),
            //    subtitle: Text("100000฿"),
            //    trailing: IconButton(onPressed: (){}, icon: Icon(Icons.add,color: Colors.white,),
            //    ),

            //  ),
            //  ListTile(
            //    contentPadding: EdgeInsets.all(8.0),
            //    title: Text('Bugatti Divo'),
            //    textColor: Color.fromARGB(255, 61, 216, 154),
            //    leading: Image.asset('assets/images/Aston.jpg'),
            //    subtitle: Text("100000฿"),
            //    trailing: IconButton(onPressed: (){}, icon: Icon(Icons.add,color: Colors.white,),
            //    ),

            //  ),
            //  ListTile(
            //    contentPadding: EdgeInsets.all(8.0),
            //    title: Text('Bugatti Divo'),
            //    textColor: Color.fromARGB(255, 61, 216, 154),
            //    leading: Image.asset('assets/images/k2.jpg'),
            //    subtitle: Text("100000฿"),
            //    trailing: IconButton(onPressed: (){}, icon: Icon(Icons.add,color: Colors.white,),
            //    ),

            //  ),
            //  ListTile(
            //    contentPadding: EdgeInsets.all(8.0),
            //    title: Text('Bugatti Divo'),
            //    textColor: Color.fromARGB(255, 61, 216, 154),
            //    leading: Image.asset('assets/images/b1.jpg'),
            //    subtitle: Text("100000฿"),
            //    trailing: IconButton(onPressed: (){}, icon: Icon(Icons.add,color: Colors.white,),
            //    ),

            //  ),
            //  ListTile(
            //    contentPadding: EdgeInsets.all(8.0),
            //    title: Text('Bugatti Divo'),
            //    textColor: Color.fromARGB(255, 61, 216, 154),
            //    leading: Image.asset('assets/images/b1.jpg'),
            //    subtitle: Text("100000฿"),
            //    trailing: IconButton(onPressed: (){}, icon: Icon(Icons.add,color: Colors.white,),
            //    ),

            //  ),
            //  ListTile(
            //    contentPadding: EdgeInsets.all(8.0),
            //    title: Text('Bugatti Divo'),
            //    textColor: Color.fromARGB(255, 61, 216, 154),
            //    leading: Image.asset('assets/images/b1.jpg'),
            //    subtitle: Text("100000฿"),
            //    trailing: IconButton(onPressed: (){}, icon: Icon(Icons.add,color: Colors.white,),
            //    ),

            //  ),
           ],
         ),
       ),
     ],)

    );
  }
}

// class ResPages extends StatelessWidget {
//   ResPages({ Key? key }) : super(key: key);
//
//
//  List<Map<String, dynamic>> _users = [];
//   bool _isLoading = true;
//
//   get index => null;
//
//
//   void _refreshUsers() async {
//     final data = await SQLHelper.getUsers();
//     setState(() {
//       _users = data;
//       _isLoading = false;
//     });
//   }
//
//   var carList = [
//     {"id": 1, "name": "Bugatti Divo1", "price": 100000},
//     {"id": 2, "name": "Bugatti Divo2", "price": 200000},
//     {"id": 3, "name": "Bugatti Divo3", "price": 300000},
//     {"id": 4, "name": "Bugatti Divo4", "price": 400000},
//     {"id": 5, "name": "Bugatti Divo5", "price": 500000},
//     {"id": 6, "name": "Bugatti Divo6", "price": 600000},
//     {"id": 7, "name": "Bugatti Divo7", "price": 700000},
//   ];
//
//   late String name;
//   late String price;
//
//   Future addCars() async {
//     final car = Car(
//       // id: id,
//       name: name,
//       price: price,
//     );
//
//     await NotesDatabase.instance.create(food);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromRGBO(12, 21, 25, 1),
//       appBar: AppBar(
//         title: Text('All Cars'),
//         backgroundColor: Colors.black12,
//
//         actions: [
//           IconButton(onPressed: (){
//             Navigator.push(
//               context, MaterialPageRoute(
//               builder: (context) => Carorder()));
//           },
//           icon: Icon(Icons.car_repair),
//           iconSize: 27,
//           color: Colors.white,
//           ),
//         ],
//         ),
//     drawer: MainDrawer(),
//
//      body:
//      ListView(children: [
//        Container(
//          padding: EdgeInsets.all(8.0),
//          child: Column(
//            children: [
//              SizedBox(
//                width: double.infinity,
//                height: 200.0,
//                // child: Carousel(
//                //   dotSize: 6.0,
//                //   dotSpacing: 10.0,
//                //   dotPosition: DotPosition.bottomCenter,
//                //   images: [Image.asset('assets/images/Lambo.jpg',fit: BoxFit.fill,),
//                //   Image.asset('assets/images/b1.jpg',fit: BoxFit.fill,),
//                //   Image.asset('assets/images/Aston.jpg',fit: BoxFit.fill,),
//                //   Image.asset('assets/images/k2.jpg',fit: BoxFit.fill,),
//                //   Image.asset('assets/images/mg.jpg',fit: BoxFit.fill,),
//                //   ],
//                // ),
//              ),
//              ListTile(
//                 contentPadding: EdgeInsets.all(8.0),
//                title: Text(carList[0]['name'].toString()),
//                textColor: Color.fromARGB(255, 61, 216, 154),
//                leading: Hero
//                (tag: 'img',
//                child: Image.asset('assets/images/IMG.jpg',width: 100.0,height: 100.0,fit: BoxFit.cover,)),
//                subtitle: Text(carList[0]['price'].toString() + "B"),
//                trailing: IconButton(onPressed: (){
//                  setState((){
//                    this.name = carList[0]['name'].toString();
//                    this.price = carList[0]['price'].toString();
//                    addCar();
//                  });
//               //    Navigator.push(context, MaterialPageRoute(
//               // builder: (context) => AddDataPage())
//               // );
//                }, icon: Icon(Icons.add,color: Colors.white,),
//              ),
//              ),
//              ListTile(
//                contentPadding: EdgeInsets.all(8.0),
//                title: Text(carList[0]['name'].toString()),
//                textColor: Color.fromARGB(255, 61, 216, 154),
//                leading: Hero
//                  (tag: 'img',
//                    child: Image.asset('assets/images/IMG.jpg',width: 100.0,height: 100.0,fit: BoxFit.cover,)),
//                subtitle: Text(carList[0]['price'].toString() + "B"),
//                trailing: IconButton(onPressed: (){
//                  Navigator.push(context, MaterialPageRoute(
//                      builder: (context) => AddDataPage())
//                  );
//                }, icon: Icon(Icons.add,color: Colors.white,),
//                ),
//              ),
//              ListTile(
//                contentPadding: EdgeInsets.all(8.0),
//                title: Text(carList[1]['name'].toString()),
//                textColor: Color.fromARGB(255, 61, 216, 154),
//                leading: Hero
//                  (tag: 'img',
//                    child: Image.asset('assets/images/IMG.jpg',width: 100.0,height: 100.0,fit: BoxFit.cover,)),
//                subtitle: Text(carList[1]['price'].toString() + "B"),
//                trailing: IconButton(onPressed: (){
//                  Navigator.push(context, MaterialPageRoute(
//                      builder: (context) => AddDataPage())
//                  );
//                }, icon: Icon(Icons.add,color: Colors.white,),
//                ),
//              ),
//              ListTile(
//                contentPadding: EdgeInsets.all(8.0),
//                title: Text(carList[2]['name'].toString()),
//                textColor: Color.fromARGB(255, 61, 216, 154),
//                leading: Hero
//                  (tag: 'img',
//                    child: Image.asset('assets/images/IMG.jpg',width: 100.0,height: 100.0,fit: BoxFit.cover,)),
//                subtitle: Text(carList[2]['price'].toString() + "B"),
//                trailing: IconButton(onPressed: (){
//                  Navigator.push(context, MaterialPageRoute(
//                      builder: (context) => AddDataPage())
//                  );
//                }, icon: Icon(Icons.add,color: Colors.white,),
//                ),
//              ),
//              ListTile(
//                contentPadding: EdgeInsets.all(8.0),
//                title: Text(carList[3]['name'].toString()),
//                textColor: Color.fromARGB(255, 61, 216, 154),
//                leading: Hero
//                  (tag: 'img',
//                    child: Image.asset('assets/images/IMG.jpg',width: 100.0,height: 100.0,fit: BoxFit.cover,)),
//                subtitle: Text(carList[3]['price'].toString() + "B"),
//                trailing: IconButton(onPressed: (){
//                  Navigator.push(context, MaterialPageRoute(
//                      builder: (context) => AddDataPage())
//                  );
//                }, icon: Icon(Icons.add,color: Colors.white,),
//                ),
//              ),
//              ListTile(
//                contentPadding: EdgeInsets.all(8.0),
//                title: Text(carList[4]['name'].toString()),
//                textColor: Color.fromARGB(255, 61, 216, 154),
//                leading: Hero
//                  (tag: 'img',
//                    child: Image.asset('assets/images/IMG.jpg',width: 100.0,height: 100.0,fit: BoxFit.cover,)),
//                subtitle: Text(carList[4]['price'].toString() + "B"),
//                trailing: IconButton(onPressed: (){
//                  Navigator.push(context, MaterialPageRoute(
//                      builder: (context) => AddDataPage())
//                  );
//                }, icon: Icon(Icons.add,color: Colors.white,),
//                ),
//              ),
//              ListTile(
//                contentPadding: EdgeInsets.all(8.0),
//                title: Text(carList[5]['name'].toString()),
//                textColor: Color.fromARGB(255, 61, 216, 154),
//                leading: Hero
//                  (tag: 'img',
//                    child: Image.asset('assets/images/IMG.jpg',width: 100.0,height: 100.0,fit: BoxFit.cover,)),
//                subtitle: Text(carList[5]['price'].toString() + "B"),
//                trailing: IconButton(onPressed: (){
//                  Navigator.push(context, MaterialPageRoute(
//                      builder: (context) => AddDataPage())
//                  );
//                }, icon: Icon(Icons.add,color: Colors.white,),
//                ),
//              ),
//              ListTile(
//                contentPadding: EdgeInsets.all(8.0),
//                title: Text(carList[6]['name'].toString()),
//                textColor: Color.fromARGB(255, 61, 216, 154),
//                leading: Hero
//                  (tag: 'img',
//                    child: Image.asset('assets/images/IMG.jpg',width: 100.0,height: 100.0,fit: BoxFit.cover,)),
//                subtitle: Text(carList[6]['price'].toString() + "B"),
//                trailing: IconButton(onPressed: (){
//                  Navigator.push(context, MaterialPageRoute(
//                      builder: (context) => AddDataPage())
//                  );
//                }, icon: Icon(Icons.add,color: Colors.white,),
//                ),
//              ),
//             //  ClipRRect(
//             //    borderRadius: BorderRadius.circular(10),
//             //    child: Show(),
//             //  ),
//             //  ListTile(
//             //    contentPadding: EdgeInsets.all(8.0),
//             //    title: Text('Bugatti Divo'),
//             //    textColor: Color.fromARGB(255, 61, 216, 154),
//             //    leading: Image.asset('assets/images/b1.jpg'),
//             //    subtitle: Text("100000฿"),
//             //    trailing: IconButton(onPressed: (){}, icon: Icon(Icons.add,color: Colors.white,),
//             //    ),
//
//             //  ),
//             //  ListTile(
//             //    contentPadding: EdgeInsets.all(8.0),
//             //    title: Text('Bugatti Divo'),
//             //    textColor: Color.fromARGB(255, 61, 216, 154),
//             //    leading: Image.asset('assets/images/Aston.jpg'),
//             //    subtitle: Text("100000฿"),
//             //    trailing: IconButton(onPressed: (){}, icon: Icon(Icons.add,color: Colors.white,),
//             //    ),
//
//             //  ),
//             //  ListTile(
//             //    contentPadding: EdgeInsets.all(8.0),
//             //    title: Text('Bugatti Divo'),
//             //    textColor: Color.fromARGB(255, 61, 216, 154),
//             //    leading: Image.asset('assets/images/k2.jpg'),
//             //    subtitle: Text("100000฿"),
//             //    trailing: IconButton(onPressed: (){}, icon: Icon(Icons.add,color: Colors.white,),
//             //    ),
//
//             //  ),
//             //  ListTile(
//             //    contentPadding: EdgeInsets.all(8.0),
//             //    title: Text('Bugatti Divo'),
//             //    textColor: Color.fromARGB(255, 61, 216, 154),
//             //    leading: Image.asset('assets/images/b1.jpg'),
//             //    subtitle: Text("100000฿"),
//             //    trailing: IconButton(onPressed: (){}, icon: Icon(Icons.add,color: Colors.white,),
//             //    ),
//
//             //  ),
//             //  ListTile(
//             //    contentPadding: EdgeInsets.all(8.0),
//             //    title: Text('Bugatti Divo'),
//             //    textColor: Color.fromARGB(255, 61, 216, 154),
//             //    leading: Image.asset('assets/images/b1.jpg'),
//             //    subtitle: Text("100000฿"),
//             //    trailing: IconButton(onPressed: (){}, icon: Icon(Icons.add,color: Colors.white,),
//             //    ),
//
//             //  ),
//             //  ListTile(
//             //    contentPadding: EdgeInsets.all(8.0),
//             //    title: Text('Bugatti Divo'),
//             //    textColor: Color.fromARGB(255, 61, 216, 154),
//             //    leading: Image.asset('assets/images/b1.jpg'),
//             //    subtitle: Text("100000฿"),
//             //    trailing: IconButton(onPressed: (){}, icon: Icon(Icons.add,color: Colors.white,),
//             //    ),
//
//             //  ),
//            ],
//          ),
//        ),
//      ],)
//
//     );
//   }
//
//   // void setState(Null Function() param0) {}
// }

// class SQLHelper {
//   static getUsers() {}
//
//   static createUser(String text, String text2, TextEditingController addCtrl) {}
//
//   static updateUser(int id, String text, String text2) {}
// }