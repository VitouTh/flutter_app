import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/widgets/big_text.dart';
import 'package:movie_app/widgets/small_text.dart';
import 'food_detail.dart';
import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  // final databaseRef = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //Showing the header
          Container(
            child: Container(
              margin: const EdgeInsets.only(top: 60, bottom: 15),
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      // children: [Text("Bangladesh"), Text("City")],
                      children: [
                        BigText(text: "ThaiFood", color: Colors.green),
                        Row(
                          children: [
                            SmallText(
                              text: "Rice.",
                              color: Colors.black54,
                            ),
                          ],
                        )
                      ]),
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      // textStyle: TextStyle(color: Colors.white),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FoodDetail()),
                      )
                    },
                    icon: Icon(
                      Icons.navigate_next,
                      color: Colors.white,
                    ),
                    label: Text(
                      '',
                    ),
                  ),
                ],
              ),
            ),
          ),
          //Showing The body
          Expanded(
              child: SingleChildScrollView(
            child: FoodPageBody(),
          ))
        ],
      ),
    );
  }
}
