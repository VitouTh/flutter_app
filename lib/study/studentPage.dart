
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'studentData.dart';
import 'updateStudent.dart';
import 'addData.dart';
import 'package:flutter/widgets.dart';
class StudentPage extends StatefulWidget {

  const StudentPage({Key? key}) : super(key: key);

  @override
  _StudentPageState createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {

  late Future<List<Tourist>> tourists;
  // final touristListKey = GlobalKey<_StudentPageState>();

  bool searching = false, error= false;
  var data;
  String query = "";

  @override
  void initState(){
    searching = false;
    error = false;
    query = "";
    super.initState();
    tourists = getStudentList();

  }

  void deleteStudent(context, id) async {
    await http.post(
      Uri.parse("http://localhost:8080/flutter_api/delete.php"),
      body: {
        'id': id.toString(),
      },
    );
    // Navigator.pop(context);
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }

  void _onAddData(context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => AddData()));
  }

  void confirmDelete(context, id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text('คุณแน่ใจหรือไม่ว่าต้องการลบข้อมูลนี้้'),
          actions: <Widget>[
            RaisedButton(
              child: Icon(Icons.cancel),
              color: Colors.red,
              textColor: Colors.white,
              onPressed: () => Navigator.of(context).pop(),
            ),
            RaisedButton(
              child: Icon(Icons.check_circle),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () => deleteStudent(context, id),
            ),
          ],
        );
      },
    );
  }

  Future<List<Tourist>> getStudentList() async{
    final response = await http.get(Uri.parse("http://localhost:8080/flutter_api/list.php"+ "?query=" + Uri.encodeComponent(query)));

    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<Tourist> students = items.map<Tourist>((json) {
      return Tourist.fromJson(json);
    }).toList();

    return students;
  }


  Widget searchField(){ //search input field
    return Container(
        child:TextField(
          autofocus: true,
          style: TextStyle(color:Colors.white, fontSize: 18),
          decoration:InputDecoration(
            hintStyle: TextStyle(color:Colors.white, fontSize: 18),
            hintText: "ค้นหาสถานที่ท่องเที่ยว",
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color:Colors.white, width:2),
            ),//under line border, set OutlineInputBorder() for all side border
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color:Colors.white, width:2),
            ), // focused border color
          ), //decoration for search input field
          onChanged: (value){
            query = value; //update the value of query
            setState(() {
              tourists = getStudentList();
            });
             //start to get suggestion
          },
        )
    );
  }


  Widget build(BuildContext context) {
    return Scaffold(
      // key: touristListKey,
      backgroundColor: Colors.black,
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: _buildBotoomNavigation(),

    );
  }

  _buildAppBar(){
    return AppBar(
      leading: IconButton(
        icon:searching?Icon(Icons.arrow_back):Icon(Icons.add),
        onPressed:(){
          if(!searching){
            _onAddData(context);
          }
          setState(() {
            searching = false;
            //set not searching on back button press
          });
        },
      ),
      //if searching is true then show arrow back else play arrow
      title:searching?searchField():Text("สถานที่ท่องเที่ยว"),
      actions: [
        IconButton(
            icon: Icon(Icons.search),
            onPressed:(){
              setState(() {
                searching = true;
              });
            }
        ),
      ],
      backgroundColor: Colors.red.withOpacity(0.7),
      //if searching set background to orange, else set to deep orange
    );
  }

  _buildBody(){
    return Center(
      child: FutureBuilder<List<Tourist>>(
        future: tourists,
        builder: (BuildContext context, AsyncSnapshot snapshot){
          // By default, show a loading spinner.
          if (!snapshot.hasData) return CircularProgressIndicator();

          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index){
                var data = snapshot.data[index];
                return Container(
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        InkWell(
                          onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateStudent(tourist: data,)));},
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 200,
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 200,
                                  child: Image.asset("assets/upload/" + data.img, fit: BoxFit.cover),
                                  color: Colors.white,
                                ),
                                Positioned(
                                  bottom: 0,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 200.0,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Colors.black.withOpacity(0.1),
                                              Colors.black.withOpacity(0.8)
                                            ]
                                        )
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width*0.8,
                                  child: Center(
                                    child: Text(data.name,
                                      style: TextStyle(fontSize: 40, color: Colors.white.withOpacity(0.5)),
                                      overflow: TextOverflow.fade,
                                      maxLines: 1,
                                      softWrap: false,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 10.0,
                                  child: Container(
                                     width: MediaQuery.of(context).size.width,
                                     height: 50,
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                                       children: <Widget>[
                                         Container(
                                          width: 80,
                                           height: 50,
                                           child: Column(
                                             children: <Widget>[
                                               Icon(Icons.location_on_sharp, color: Colors.white.withOpacity(0.5),),
                                               Flexible(child: Text(data.place, style: TextStyle(color: Colors.white),))
                                             ],
                                           ),
                                         ),
                                         RaisedButton(
                                           color: Colors.white.withOpacity(0.7),
                                           child: Text('ดูรายละเอียด'), onPressed: (){
                                           Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateStudent(tourist: data,)));
                                         },),
                                         Container(
                                           width: 80,
                                           height: 50,
                                           child: InkWell(
                                             child: Column(
                                               children: <Widget>[
                                                 Icon(Icons.delete, color: Colors.red.withOpacity(0.5),),
                                                 Text("ลบ", style: TextStyle(color: Colors.white),)
                                               ],
                                             ),
                                             onTap: () => confirmDelete(context, data.id),
                                           ),
                                         ),
                                       ],
                                     ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }

  _buildBotoomNavigation(){
    return BottomAppBar(
      color: Colors.red.withOpacity(0.7),
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
        child: Text("Avaiable ads here", style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 20),),
      ),
    );
  }
}
