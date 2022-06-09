import 'package:flutter/material.dart';
import 'package:movie_app/pass_model/carmodel.dart';
import 'package:movie_app/pass_db/sql.dart';

class Carorder extends StatefulWidget {
  final Car? car;
  const Carorder({Key? key, this.car}) : super(key: key);

  @override
  _CarorderState createState() => _CarorderState();
}

class _CarorderState extends State<Carorder> {
  late List<Car> cars;
  bool isLoading = false;
  var total = 0;

  @override
  void initState() {
    super.initState();

    refreshNotes();
  }

  Future refreshNotes() async {
    setState(() => isLoading = true);

    this.cars = await CarsDatabase.instance.readAllCars();
    // for(var car in cars){
    //   this.total = this.total + car.price;
    // }
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Order Car'),
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : cars.isEmpty
            ? Text(
          'No Cars Selected',
          style: TextStyle(color: Colors.white, fontSize: 24),
        )
            : buildBody(context, cars),
      ),
    );
  }

  Widget buildBody (BuildContext context, cars) => Container(
    margin: const EdgeInsets.only(top: 60, bottom: 15),
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: ListView(
      children: [
        for (var car in cars)
             ListTile(
                contentPadding: EdgeInsets.all(8.0),
               title: Text(car.name.toString()),
               textColor: Color.fromARGB(255, 61, 216, 154),
               leading: Hero
               (tag: 'img' + car.name.toString(),
               child: Image.asset('assets/images/IMG.jpg',width: 100.0,height: 100.0,fit: BoxFit.cover,)),
               subtitle: Text(car.price.toString() + "B"),
  trailing: new IconButton(
  onPressed: () async {
  await CarsDatabase.instance.delete(car.id);
  Navigator.pushReplacement(
  context,
  MaterialPageRoute(
  builder: (BuildContext context) => super.widget));
},
icon: Icon(Icons.delete, color: Colors.red,))
             ),
      ],
    ),
  );
}



// import 'package:flutter/material.dart';
//
// class Carorder extends StatelessWidget {
//   const Carorder({ Key? key }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Order Car'),
//       ),
//       body: ListView(
//         children: [
//           ListTile(
//                 contentPadding: EdgeInsets.all(8.0),
//                title: Text('Bugatti Divo'),
//                textColor: Color.fromARGB(255, 61, 216, 154),
//                leading: Hero
//                (tag: 'img',
//                child: Image.asset('assets/images/IMG.jpg',width: 100.0,height: 100.0,fit: BoxFit.cover,)),
//                subtitle: Text("100000฿"),
//                trailing: IconButton(onPressed: (){}, icon: Icon(Icons.add,color: Colors.white,),
//              ),
//              ),
//              ListTile(
//                 contentPadding: EdgeInsets.all(8.0),
//                title: Text('Bugatti Divo'),
//                textColor: Color.fromARGB(255, 61, 216, 154),
//                leading: Image.asset('assets/images/IMG.jpg',width: 100.0,height: 100.0,fit: BoxFit.cover,),
//                subtitle: Text("100000฿"),
//                trailing: IconButton(onPressed: (){}, icon: Icon(Icons.add,color: Colors.white,),
//              ),
//              ),
//              ListTile(
//                 contentPadding: EdgeInsets.all(8.0),
//                title: Text('Bugatti Divo'),
//                textColor: Color.fromARGB(255, 61, 216, 154),
//                leading: Image.asset('assets/images/IMG.jpg',width: 100.0,height: 100.0,fit: BoxFit.cover,),
//                subtitle: Text("100000฿"),
//                trailing: IconButton(onPressed: (){}, icon: Icon(Icons.add,color: Colors.white,),
//              ),
//              ),
//              ListTile(
//                 contentPadding: EdgeInsets.all(8.0),
//                title: Text('Bugatti Divo'),
//                textColor: Color.fromARGB(255, 61, 216, 154),
//                leading: Image.asset('assets/images/IMG.jpg',width: 100.0,height: 100.0,fit: BoxFit.cover,),
//                subtitle: Text("100000฿"),
//                trailing: IconButton(onPressed: (){}, icon: Icon(Icons.add,color: Colors.white,),
//              ),
//              ),
//              ListTile(
//                 contentPadding: EdgeInsets.all(8.0),
//                title: Text('Bugatti Divo'),
//                textColor: Color.fromARGB(255, 61, 216, 154),
//                leading: Image.asset('assets/images/IMG.jpg',width: 100.0,height: 100.0,fit: BoxFit.cover,),
//                subtitle: Text("100000฿"),
//                trailing: IconButton(onPressed: (){}, icon: Icon(Icons.add,color: Colors.white,),
//              ),
//              ),
//              ListTile(
//                 contentPadding: EdgeInsets.all(8.0),
//                title: Text('Bugatti Divo'),
//                textColor: Color.fromARGB(255, 61, 216, 154),
//                leading: Image.asset('assets/images/IMG.jpg',width: 100.0,height: 100.0,fit: BoxFit.cover,),
//                subtitle: Text("100000฿"),onTap: (){
//                 //  Navigator.push(context, MaterialPageRoute(builder: (context) => Carorder()));
//                },
//                trailing: IconButton(onPressed: (){}, icon: Icon(Icons.add,color: Colors.white,),
//              ),
//              ),
//              ListTile(
//                 contentPadding: EdgeInsets.all(8.0),
//                title: Text('Bugatti Divo'),
//                textColor: Color.fromARGB(255, 61, 216, 154),
//                leading: Image.asset('assets/images/IMG.jpg',width: 100.0,height: 100.0,fit: BoxFit.cover,),
//                subtitle: Text("100000฿"),
//                trailing: IconButton(onPressed: (){}, icon: Icon(Icons.add,color: Colors.white,),
//              ),
//              ),
//         ],
//       )
//     );
//   }
// }