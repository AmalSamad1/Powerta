

import 'package:money_management/models/Add_new_expense.dart';

import '../constant.dart';
import '../models/transactions.dart';
import '../models/categories.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../ui/chumma.dart';
import '../widgets/round_container.dart';
import '../widgets/app_bar.dart';
import 'Add_Labour.dart';
import 'new_transaction.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //get the icon
  IconData? getIcon(String category) {
    if (category == "Electrical") return Icons.electric_bolt_outlined;
    if (category == "Site") return Icons.home;
    if (category == "Wood") return Icons.door_back_door;
    if (category == "Labour") return Icons.shopping_cart;
    if (category == "Income") return Icons.attach_money_rounded;
  }

// categories
  List<Categories> categories = [
    Categories("Electrical", 0, "assets/images/party.jpg"),
    Categories("Site Eexpense", 0, "assets/images/food.jpeg"),
    Categories("Wood", 0, "assets/images/travel.jpg"),
    Categories("Labour", 0, "assets/images/shopping.jpg"),
  ];

//user transactions
  List<Transaction> userTransactions = [];

//get the total expenses
  double get getTotalExpense {
    //first I want to set all categories expense to 0, as it was adding to previous in my code
    for (var myCategory in categories) {
      myCategory.amount = 0;
    }

    double totalExpense = 0;
    for (int i = 0; i < userTransactions.length; i++) {
      if (userTransactions[i].category != 'Income') {
        totalExpense += userTransactions[i].amount;
      }
      //let's calculate the expenses for each categories

      for (var myCategory in categories) {
        if (userTransactions[i].category == myCategory.category) {
          myCategory.amount += userTransactions[i].amount;
          continue;
        }
      }
    }
    return totalExpense;
  }

//get the total income
  double get getTotalIncome {
    double totalIncome = 0;
    for (int i = 0; i < userTransactions.length; i++) {
      if (userTransactions[i].category == 'Income') {
        totalIncome += userTransactions[i].amount;
      }
    }
    return totalIncome;
  }

  void _addNewTransaction(String category,
      double amount,
      String note,
      DateTime date,) {
    final newTransaction = Transaction(category, amount, date, note);
    setState(() {
      userTransactions.add(newTransaction);
    });
  }

  bool showAllTransactions = false;

  // @override
  // Widget build(BuildContext context) {
  //   final deviceHeight = MediaQuery
  //       .of(context)
  //       .size
  //       .height;

    Card topArea() =>
        Card(
          margin: EdgeInsets.all(10.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 5.0,
          child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.green, Colors.teal])),
              padding: EdgeInsets.all(5.0),
              // color: Color(0xFF015FFF),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Align( alignment: Alignment.topCenter, child:
                      Text("Total",
                          style: TextStyle(
                               fontSize: 23.0)),),
                      Text("Advance",
                          style: TextStyle(
                               fontSize: 23.0)),

                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Align( alignment: Alignment.topCenter, child:
                      Text(r"₹ 95,940.00",
                          style: TextStyle(
                               fontSize: 20.0)),),
                      Text(r"₹ 95,940.00",
                          style: TextStyle(
                               fontSize: 20.0)),

                    ],
                  ),

                  SizedBox(height: 35.0),
                ],
              )),
        );

    @override
    Widget build(BuildContext context) {
      return
         Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: TassistMenugreen,
            child: const Icon(Icons.add,color: Colors.black,),
            onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (c)=>AddNewExpense())); },

          ),
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.black, //change your color here
            ),
            backgroundColor: TassistMenugreen,
            elevation: 0.0,
            title: Text(
              "Accounts",
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  topArea(),
                  displayAccoutList(),

                ],
              ),
            ),
          ),

        );

    }

    Container accountItems(String item, String charge, String dateString,
        String type,
       ) =>
        Container(
          decoration: BoxDecoration(),
          padding:
          EdgeInsets.only(top: 20.0, bottom: 20.0, left: 5.0, right: 5.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(item, style: TextStyle(fontSize: 16.0)),
                  Text(charge, style: TextStyle(fontSize: 16.0))
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(dateString,
                      style: TextStyle(color: Colors.grey, fontSize: 14.0)),
                  Text(type,
                      style: TextStyle(color: Colors.grey, fontSize: 14.0))
                ],
              ),
            ],
          ),
        );

    displayAccoutList() {
      return Container(
        margin: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            accountItems("Trevello App", r"+ ₹ 4,946.00", "28-04-16", "",
            ),
            accountItems(
                "Creative Studios", r"+ ₹ 5,428.00", "26-04-16", ""),
            accountItems("Amazon EU", r"+ ₹ 746.00", "25-04-216", "",
               ),
            accountItems(
                "Creative Studios", r"+ ₹ 14,526.00", "16-04-16", ""),
            accountItems(
                "Book Hub Society", r"+ ₹ 2,876.00", "04-04-16", "",
               ),
          ],
        ),
      );
    }
  }
