import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_app/food/dimensions.dart';
import 'package:movie_app/widgets/big_text.dart';
import 'package:movie_app/widgets/small_text.dart';
// import 'package:carousel_pro/carousel_pro.dart';
import 'package:movie_app/db/notes_database.dart';
import 'package:movie_app/model/food.dart';

class FoodPageBody extends StatefulWidget {
  final Food? food;
  const FoodPageBody({Key? key, this.food}) : super(key: key);

  @override
  _FoodPageBody createState() => _FoodPageBody();
}

class _FoodPageBody extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var foodList = [
    {"id": 1, "name": "ผัดพริกเเกง (Fried Chili.)", "price": 50},
    {"id": 2, "name": "ต้มยำกุ้ง ( Tom Yum Kung.)", "price": 60},
    {"id": 3, "name": "เเกงข่าไก่,ต้มข่าไก่ (Tom Kha Gai)", "price": 45},
    {"id": 4, "name": "ไก่ย่าง", "price": 50},
    {"id": 5, "name": "ผัดไทย", "price": 45},
    {"id": 6, "name": "เเพนงไก่", "price": 35},
    {"id": 7, "name": "เเกงไก่", "price": 40},
  ];

  // final _formKey = GlobalKey<FormState>();
  late int price;
  late String name;

  // var _currPagrValue = 0.0;
  // double _scaleFactor = 0.8;
  // double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    price = widget.food?.price ?? 0;
    name = widget.food?.name ?? '';
    // pageController.addListener(() {
    //   setState(() {
    //     // print(pageController.page!);
    //     _currPagrValue = pageController.page!;
    //     print("Current valur is " + _currPagrValue.toString());
    //   });
    // });
  }


  @override
  void dispose() {
    pageController.dispose();
  }

  Future addNote() async {
    final food = Food(
      // id: id,
      name: name,
      price: price,
    );

    await NotesDatabase.instance.create(food);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        // SizedBox(
        //     height: 200.0,
        //     width: 350.0,
        //     child: Carousel(
        //       images: [
        //         ExactAssetImage("assets/image/01.jpg"),
        //         ExactAssetImage("assets/image/02.jpg"),
        //         ExactAssetImage("assets/image/03.jpg"),
        //         ExactAssetImage("assets/image/03.jpg"),
        //         ExactAssetImage("assets/image/02.jpg")
        //       ],
        //       dotSize: 4.0,
        //       dotSpacing: 15.0,
        //       dotColor: Colors.lightGreenAccent,
        //       indicatorBgPadding: 5.0,
        //       // dotBgColor: Colors.purple.withOpacity(0.5),
        //       borderRadius: true,
        //       autoplay: true,
        //       autoplayDuration: Duration(seconds: 3),
        //     )),
        SizedBox(
          height: 20,
        ),
        Container(
            margin: EdgeInsets.only(left: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                BigText(text: "Popular", color: Colors.green),
                SizedBox(
                  width: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 3),
                  child: BigText(text: ".", color: Colors.black26),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 2),
                  child: SmallText(
                    text: "Food pairing",
                  ),
                )
              ],
            )),

        Container(
            height: 400,
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(children: <Widget>[
                  Card(
                      child: ListTile(
                        title: Text(foodList[0]['name'].toString()),
                        subtitle: Text(
                            foodList[0]['price'].toString() + " บาท"),
                        trailing: Icon(
                          Icons.add_circle,
                          color: Colors.blue,
                        ),
                        onTap: () {
                          setState(() {
                            this.name = foodList[0]['name'].toString();
                            this.price = int.parse(foodList[0]['price']
                                .toString());
                            addNote();
                          });
                        },
                      )),
                  Card(
                      child: ListTile(
                        title: Text(foodList[1]['name'].toString()),
                        subtitle: Text(
                            foodList[1]['price'].toString() + " บาท"),
                        trailing: Icon(
                          Icons.add_circle,
                          color: Colors.blue,
                        ),
                        onTap: () {
                          setState(() {
                            this.name = foodList[1]['name'].toString();
                            this.price = int.parse(foodList[1]['price']
                                .toString());
                            addNote();
                          });
                        },
                      )),
                  Card(
                      child: ListTile(
                        title: Text(foodList[2]['name'].toString()),
                        subtitle: Text(
                            foodList[2]['price'].toString() + " บาท"),
                        trailing: Icon(
                          Icons.add_circle,
                          color: Colors.blue,
                        ),
                        onTap: () {
                          setState(() {
                            this.name = foodList[2]['name'].toString();
                            this.price = int.parse(foodList[2]['price']
                                .toString());
                            addNote();
                          });
                        },
                      )),
                  Card(
                      child: ListTile(
                        title: Text(foodList[3]['name'].toString()),
                        subtitle: Text(
                            foodList[3]['price'].toString() + " บาท"),
                        trailing: Icon(
                          Icons.add_circle,
                          color: Colors.blue,
                        ),
                        onTap: () {
                          setState(() {
                            this.name = foodList[3]['name'].toString();
                            this.price = int.parse(foodList[3]['price']
                                .toString());
                            addNote();
                          });
                        },
                      )),
                  Card(
                      child: ListTile(
                        title: Text(foodList[4]['name'].toString()),
                        subtitle: Text(
                            foodList[4]['price'].toString() + " บาท"),
                        trailing: Icon(
                          Icons.add_circle,
                          color: Colors.blue,
                        ),
                        onTap: () {
                          setState(() {
                            this.name = foodList[4]['name'].toString();
                            this.price = int.parse(foodList[4]['price']
                                .toString());
                            addNote();
                          });
                        },
                      )),
                  Card(
                      child: ListTile(
                        title: Text(foodList[5]['name'].toString()),
                        subtitle: Text(
                            foodList[5]['price'].toString() + " บาท"),
                        trailing: Icon(
                          Icons.add_circle,
                          color: Colors.blue,
                        ),
                        onTap: () {
                          setState(() {
                            this.name = foodList[5]['name'].toString();
                            this.price = int.parse(foodList[5]['price']
                                .toString());
                            addNote();
                          });
                        },
                      )),
                  Card(
                      child: ListTile(
                        title: Text(foodList[6]['name'].toString()),
                        subtitle: Text(
                            foodList[6]['price'].toString() + " บาท"),
                        trailing: Icon(
                          Icons.add_circle,
                          color: Colors.blue,
                        ),
                        onTap: () {
                          setState(() {
                            this.name = foodList[6]['name'].toString();
                            this.price = int.parse(foodList[6]['price']
                                .toString());
                            addNote();
                          });
                        },
                      )),
                ]))) // ))
      ],
    );
  }
}

//   Widget _buildPageItem(int index) {
//     Matrix4 matrix = new Matrix4.identity();
//
//     if (index == _currPagrValue.floor() - 1) {
//       var currScale = 1 - (_currPagrValue - index) * (1 - _scaleFactor);
//       var currTrans = _height * (1 - currScale) / 2;
//       matrix = Matrix4.diagonal3Values(1, currScale, 1);
//       matrix = Matrix4.diagonal3Values(1, currScale, 1)
//         ..setTranslationRaw(0, currTrans, 0);
//     } else if (index == _currPagrValue.floor() + 1) {
//       var currScale =
//           _scaleFactor + (_currPagrValue - index + 1) * (1 - _scaleFactor);
//       var currTrans = _height * (1 - currScale) / 2;
//       matrix = Matrix4.diagonal3Values(1, currScale, 1);
//       matrix = Matrix4.diagonal3Values(1, currScale, 1)
//         ..setTranslationRaw(0, currTrans, 0);
//     } else if (index == _currPagrValue.floor() - 1) {
//       var currScale = 1 - (_currPagrValue - index) * (1 - _scaleFactor);
//       var currTrans = _height * (1 - currScale) / 2;
//       matrix = Matrix4.diagonal3Values(1, currScale, 1);
//       matrix = Matrix4.diagonal3Values(1, currScale, 1)
//         ..setTranslationRaw(0, currTrans, 0);
//     } else {
//       var currScale = 0.8;
//       matrix = Matrix4.diagonal3Values(1, currScale, 1)
//         ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
//     }
//
//     return Transform(
//         transform: matrix,
//         child: Stack(
//           children: [
//             Container(
//               height: Dimensions.pageViewContainer,
//               margin: EdgeInsets.only(left: 5, right: 5),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(30),
//                   color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc)),
//             )
//           ],
//         ));
//   }
// }
