
import 'package:flutter/material.dart';
import 'package:money_management/gst.dart';
import 'package:money_management/parties.dart';
import 'package:money_management/ui/chumma.dart';
import 'package:money_management/ui/drawer.dart';

import 'ui/dropdown_search.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
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
    home:DefaultTabController(
        length: 5,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (c)=>DrowpDownSearch()));},
          backgroundColor: TassistMenugreen,
            tooltip: 'Increment',
            child: const Icon(Icons.add,color: Colors.black,),
          ), // This trailing comma makes auto-formatting nicer for build methods.
          drawer: NavBar(),
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor:TassistMenugreen,
            elevation: 0,
            bottom: TabBar(
                labelColor: Color(0xFF0E495F),
                unselectedLabelColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: Colors.white),
                tabs: [
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Parties"),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Transaction"),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Items"),
                    ),
                  ),
                ]
            ),
          ),
          body: TabBarView(children: [
            Parties(),
            Icon(Icons.games),
            Icon(Icons.games),
          ]),
        )
    ),
    );

  }
}
