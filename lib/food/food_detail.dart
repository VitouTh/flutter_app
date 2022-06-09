import 'package:flutter/material.dart';
import 'package:movie_app/db/notes_database.dart';
import 'package:movie_app/model/food.dart';
import 'package:movie_app/widgets/big_text.dart';

class FoodDetail extends StatefulWidget {
  final Food? food;
  const FoodDetail({Key? key, this.food}) : super(key: key);

  @override
  _FoodDetailState createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  late List<Food> foods;
  bool isLoading = false;
  var total = 0;
  @override
  void initState() {
    super.initState();

    refreshNotes();
  }


  Future refreshNotes() async {
    setState(() => isLoading = true);

    this.foods = await NotesDatabase.instance.readAllFoods();
    for(var food in foods){
      this.total = this.total + food.price.toInt();
    }
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : foods.isEmpty
            ? Text(
          'No Foods',
          style: TextStyle(color: Colors.white, fontSize: 24),
        )
            : buildBody(context, foods),
      ),
    );

  }
  Widget buildBody(BuildContext context, foods) => Container(
    margin: const EdgeInsets.only(top: 60, bottom: 15),
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              // children: [Text("Bangladesh"), Text("City")],
                children: [
                  BigText(text: "รายการ", color: Colors.green),
                ]),
            TextButton.icon(
              style: TextButton.styleFrom(
                // textStyle: TextStyle(color: Colors.white),
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
              ),
              onPressed: () => {Navigator.pop(context)},
              icon: Icon(
                Icons.navigate_before,
                color: Colors.white,
              ),
              label: Text(
                '',
              ),
            ),
          ],

        ),
        Expanded(
          child: ListView(
            children: [
              for (var food in foods)
                ListTile(
                    leading: Icon(Icons.fastfood_sharp),
                    title: Text(food.name.toString()),
                    subtitle: Text(food.price.toString()),
                    trailing: new IconButton(
                        onPressed: () async {
                          await NotesDatabase.instance.delete(food.id);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => super.widget));
                        },
                        icon: Icon(Icons.delete, color: Colors.red,))
                )
            ],
          ),
        ),
        Expanded(child: ListTile(
          leading: Icon(Icons.attach_money_rounded),
          title: Text("ทั้งหมด: " + total.toString() + " บาท"),

        ))

      ],
    ),
  );
}



