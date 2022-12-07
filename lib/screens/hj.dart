import 'package:flutter/material.dart';
import 'package:money_management/screens/hj.dart';
import 'package:money_management/ui/Labour_View.dart';

import '../homePage.dart';
import '../screens/homepage.dart';
import '../ui/chumma.dart';

class SiteView extends StatefulWidget {
  const SiteView({Key? key}) : super(key: key);

  @override
  _LabourViewState createState() => _LabourViewState();
}

class _LabourViewState extends State<SiteView> {
  // This holds a list of fiction users
  // You can use data fetched from a database or a server as well
  final List<Map<String, dynamic>> _allUsers = [
    { "sitename": "Alappuzha", "total": 100000},
    { "sitename": "Kannur", "total": 500000},
    { "sitename": "Pathanamthitta", "total": 1500000},
    {"sitename": "Idukki", "total": 3500000},
    { "sitename": "Karungappally", "total": 2100000},
    {"sitename": "Kollam", "total": 5500000},
    {"sitename": "Kottayam", "total": 3000000},
    {"sitename": "Thiruvananthapuram", "total": 1400000},
    { "sitename": "Kottayam", "total": 1000000},
    { "sitename": "Eranakulam", "total": 3200000},
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor:TassistMenugreen,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () { Navigator.of(context).push(MaterialPageRoute(builder: (c)=>HomePage1()));
          },
        ),
          title: const Text('Site List',style: TextStyle(color: Colors.black),),
        centerTitle: true,
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
                  return LabourView(

                  );
                }));},
                  child:Card(
                    key: ValueKey(_foundUsers[index]["id"]),
                    color: Colors.white,
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      title:Text(_foundUsers[index]['sitename']),
                      subtitle: Text(
                          '${_foundUsers[index]["total"].toString()} '),
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
    );
  }
  _pop(){

  }
}