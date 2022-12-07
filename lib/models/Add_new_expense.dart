import 'package:flutter/material.dart';

import '../constant.dart';

class AddNewExpense extends StatefulWidget {
  const AddNewExpense({Key? key}) : super(key: key);

  @override
  State<AddNewExpense> createState() => _AddNewExpenseState();
}

class _AddNewExpenseState extends State<AddNewExpense> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:SingleChildScrollView(child: Column(
        children: [
          SizedBox(height: 40,),
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Date',
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Site',
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextField(

            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Wage',
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'OT Wage',
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'No.of Days',
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'OT Hour',
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'TA/DA',
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Advance',
            ),
          ),
        ],
      ),
      ),
      floatingActionButton:
      Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 60.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Color(0xff3CADE6),
        ),
        child: TextButton(
          child: const Text(
            "Add Expense",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: (){},
        ),
      ),
    );
  }
}
