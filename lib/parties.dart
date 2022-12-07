import 'package:flutter/material.dart';

class Parties extends StatelessWidget {
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
      home: Scaffold(
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text(
                'John Judah',
              ),
              subtitle: Text('08 Nov 2022'),
              trailing: Text("    ₹3000\n\nYou'll Give"
                ,style: TextStyle(color: Colors.red),),
              onTap: () {
                Text('Another data');
              },
            ),
            new Divider(
              height: 1.0,
              indent: 1.0,
            ),
            ListTile(
              title: Text('Bisola Akanbi'),
              subtitle: Text('08 Nov 2022'),
              trailing: Text("    ₹2000\n\nYou'll Get"
                  ,style: TextStyle(color: Colors.green),),
              onTap: () {
                Text('Another data');
              },
              onLongPress: () {
                Text('Data');
              },
            ),
            new Divider(
              height: 1.0,
              indent: 1.0,
            ),
            ListTile(
              title: Text('Eghosa Iku'),
              subtitle: Text('08 Nov 2022'),
              trailing: Text("    ₹500\n\nYou'll Give"
                ,style: TextStyle(color: Colors.red),),
            ),
            new Divider(
              height: 1.0,
              indent: 1.0,
            ),
            ListTile(
              title: Text(
                'Andrew Ndebuisi',
              ),
              subtitle: Text('08 Nov 2022'),
              trailing: Text("    ₹750\n\nYou'll Get"
                ,style: TextStyle(color: Colors.green),),
            ),
            new Divider(
              height: 1.0,
              indent: 1.0,
            ),
            ListTile(
              title: Text('Arinze Dayo'),
              subtitle: Text('08 Nov 2022'),
              trailing: Text("    ₹1000\n\nYou'll Give"
                ,style: TextStyle(color: Colors.red),),
            ),
            new Divider(
              height: 1.0,
              indent: 1.0,
            ),
            ListTile(
              title: Text('Wakara Zimbu'),
              subtitle: Text('08 Nov 2022'),
              trailing: Text("    ₹2000\n\nYou'll Get"
                ,style: TextStyle(color: Colors.green),),
            ),
            new Divider(
              height: 1.0,
              indent: 1.0,
            ),
            ListTile(
              title: Text('Emaechi Chinedu'),
              subtitle: Text('08 Nov 2022'),
              trailing: Text("    ₹7500\n\nYou'll Get"
                ,style: TextStyle(color: Colors.red),),
            ),
            new Divider(
              height: 1.0,
              indent: 10.0,
            ),
            ListTile(
              title: Text('Osaretin Igbinomwanhia'),
              subtitle: Text('08 Nov 2022'),
              trailing: Text("    ₹5000\n\nYou'll Get"
                ,style: TextStyle(color: Colors.green),),
            ),
            new Divider(
              height: 1.0,
              indent: 10.0,
            ),
            ListTile(
              title: Text('Osagumwenro Nosa'),
              subtitle: Text('08 Nov 2022'),
              trailing: Text("    ₹2000\n\nYou'll Get"
                ,style: TextStyle(color: Colors.green),),
            ),
          ],
        ),
      ),
    );
  }
}