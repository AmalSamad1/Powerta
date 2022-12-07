import 'package:flutter/material.dart';
import 'package:money_management/screens/Add_Labour.dart';
import 'package:money_management/screens/hj.dart';
import '../homePage.dart';
import '../screens/homepage.dart';
import 'chumma.dart';

class LabourView extends StatefulWidget {
  const LabourView({Key? key}) : super(key: key);

  @override
  _LabourViewState createState() => _LabourViewState();
}

class _LabourViewState extends State<LabourView> {
  // This holds a list of fiction users
  // You can use data fetched from a database or a server as well
  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": "Andy", "age": 29},
    {"id": 2, "name": "Aragon", "age": 40},
    {"id": 3, "name": "Bob", "age": 5},
    {"id": 4, "name": "Barbara", "age": 35},
    {"id": 5, "name": "Candy", "age": 21},
    {"id": 6, "name": "Colin", "age": 55},
    {"id": 7, "name": "Audra", "age": 30},
    {"id": 8, "name": "Banana", "age": 14},
    {"id": 9, "name": "Caversky", "age": 100},
    {"id": 10, "name": "Becky", "age": 32},
  ];


  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
          user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Powerta',
        theme:  ThemeData(
        primaryColor: Colors.white,
        cardColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    darkTheme: ThemeData.dark().copyWith(
    primaryColor: Colors.black45,
    cardColor: Colors.black87
    ),
    debugShowCheckedModeBanner: false,
    home:Scaffold(
      floatingActionButton: FloatingActionButton(backgroundColor: TassistMenugreen,
        onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (c)=>AddLabour()));},
        child: const Icon(Icons.add,color: Colors.black,),

      ),
      appBar: AppBar(
        title: const Text('Labour List',style: TextStyle(color:Colors.black ),),
          backgroundColor:TassistMenugreen,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () { Navigator.of(context).push(MaterialPageRoute(builder: (c)=>HomePage1()));
              },
          ),
          centerTitle: true,
          actions: <Widget>[
           IconButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (c)=>SiteView()));}, icon: Icon(Icons.sort,color: Colors.black,))
  ]
    ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                labelText: 'Search', suffixIcon: Icon(Icons.search),),
            ),

            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                itemCount: _foundUsers.length,
                itemBuilder: (context, index) => InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HomePage(
                       name:  _foundUsers[index]["name"],
                  );
                }));},
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Align( alignment: Alignment.topCenter, child:
                            Text("Name",
                              textAlign: TextAlign.center,
                              style: new TextStyle(
                                fontWeight: FontWeight.w500
                              ),),),
                            Text("Amal",
                              textAlign: TextAlign.center,
                              style: new TextStyle(
                                fontWeight: FontWeight.w500,

                              ),),


                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Align( alignment: Alignment.topCenter, child:
                            Text("Designation",
                              style: new TextStyle(
                                fontWeight: FontWeight.w500),)),
                            Text("Helper",
                              style: new TextStyle(
                                fontWeight: FontWeight.w500,)),

                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Align( alignment: Alignment.topCenter, child:
                            Text("Wage",
                                style: new TextStyle(
                                  fontWeight: FontWeight.w500,)),),
                            Text("700",
                                style: new TextStyle(
                                  fontWeight: FontWeight.w500,)),

                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Align( alignment: Alignment.topCenter, child:
                            Text("OT Wage",
                                style: new TextStyle(
                                  fontWeight: FontWeight.w500,) ),),
                            Text("100",
                                style: new TextStyle(
                                  fontWeight: FontWeight.w500,) ),

                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Align( alignment: Alignment.topCenter, child:
                            Text("No.of Days",
                                style: new TextStyle(
                                  fontWeight: FontWeight.w500,)),),
                            Text("2",
                                style: new TextStyle(
                                  fontWeight: FontWeight.w500,)  ),

                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Align( alignment: Alignment.topCenter, child:
                            Text("OT Hour",
                                style: new TextStyle(
                                  fontWeight: FontWeight.w500,)),),
                            Text("2",
                                style: new TextStyle(
                                  fontWeight: FontWeight.w500,) ),

                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Align( alignment: Alignment.topCenter, child:
                            Text("TA/DA",
                                style: new TextStyle(
                                  fontWeight: FontWeight.w500,)),),
                            Text("50",
                                style: new TextStyle(
                                  fontWeight: FontWeight.w500,) ),

                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Align( alignment: Alignment.topCenter, child:
                            Text("Advance",
                                style: new TextStyle(
                                  fontWeight: FontWeight.w500,) ),),
                            Text("1000",
                                style: new TextStyle(
                                  fontWeight: FontWeight.w500,)  ),

                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Align( alignment: Alignment.topCenter, child:
                            Text("Total Amount",
                                style: new TextStyle(
                                  fontWeight: FontWeight.w500,) ),),
                            Text("1600",
                                style: new TextStyle(
                                  fontWeight: FontWeight.w500,) ),

                          ],
                        ),

                      ],
                    ),
                  ),
                ),
                ),
              )
                  : const Text(
                'No results found',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }

}