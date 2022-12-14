// import 'package:expense_tracker/widgets/flat_container.dart';


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../constant.dart';
import '../models/categories.dart';

class NewTransaction extends StatefulWidget {
  const NewTransaction({Key? key, required this.addNewTransaction})
      : super(key: key);
  final Function addNewTransaction;
  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  TextEditingController amountController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  int _activeStepIndex = 0;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController pincode = TextEditingController();
  List<Step> stepList() => [
    Step(
      state: _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
      isActive: _activeStepIndex >= 0,
      title: const Text('Account'),
      content: Container(
        child: Column(
          children: [
            TextField(
              controller: name,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Full Name',
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: email,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Mobile Number',
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: email,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Designation',
              ),
            ),
          ],
        ),
      ),
    ),
    Step(
        state:
        _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
        isActive: _activeStepIndex >= 1,
        title: const Text('Address'),
        content: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: address,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Full House Address',
                ),
              ),
              const SizedBox(
                height: 8,
              ),

              TextField(
                controller: pincode,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'State',
                ),
              ),
              TextField(
                controller: pincode,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'District',
                ),
              ),
              TextField(
                controller: pincode,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Pin Code',
                ),
              ),
            ],
          ),
        )),
    Step(
        state:
        _activeStepIndex <= 2? StepState.editing : StepState.complete,
        isActive: _activeStepIndex >= 2,
        title: const Text(''),
        content: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: address,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Date',
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: pincode,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Site',
                ),
              ),
              TextField(
                controller: pincode,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Wage',
                ),
              ),
              TextField(
                controller: pincode,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'OT Wage',
                ),
              ),
              TextField(
                controller: pincode,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'No.of Days',
                ),
              ),
              TextField(
                controller: pincode,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'OT Hour',
                ),


              ),
              TextField(
                controller: pincode,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'TA/DA',
                ),
              ),
              TextField(
                controller: pincode,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Advance',
                ),
              ),
            ],
          ),
        )),
    Step(
        state: StepState.complete,
        isActive: _activeStepIndex >= 3,
        title: const Text('Confirm'),
        content: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Name: ${name.text}'),
                Text('Email: ${email.text}'),
                const Text('Password: *****'),
                Text('Address : ${address.text}'),
                Text('PinCode : ${pincode.text}'),
              ],
            )))
  ];

  String category = "Expense";

  DateTime? date;
  void _submitTransaction() {
    double expense = double.tryParse(amountController.text) ?? 0.00;
    String note = noteController.text;
    if (incomeSelected) {
      category = "Income";
    }
    if (expense <= 0.00 ||
        amountController.text.isEmpty ||
        date == null ||
        note.isEmpty) {
      return;
    }
    widget.addNewTransaction(category, expense, note, date);
    Navigator.pop(context);
  }

  bool expenseSelected = true;
  bool incomeSelected = false;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: const Color(0xff757575),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xfff5f5f5),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.0),
              topLeft: Radius.circular(30.0),
            ),
          ),
          padding: EdgeInsets.only(
              left: 20.0,
              top: 30.0,
              right: 20.0,
              bottom: MediaQuery.of(context).viewInsets.bottom + 20),
          child: Column(
            children: [
              const Text(
                "Add New Expense",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                child:
              Stepper(
                type: StepperType.vertical,
                currentStep: _activeStepIndex,
                steps: stepList(),
                onStepContinue: () {
                  if (_activeStepIndex < (stepList().length - 1)) {
                    setState(() {
                      _activeStepIndex += 1;
                    });
                  } else {
                    print('Submited');
                  }
                },
                onStepCancel: () {
                  if (_activeStepIndex == 0) {
                    return;
                  }
                  setState(() {
                    _activeStepIndex -= 1;
                  });
                },
                onStepTapped: (int index) {
                  setState(() {
                    _activeStepIndex = index;
                  });
                },

              ),

              ),

              // ToggleSwitch(
              //   totalSwitches: 2,
              //   labels: const [
              //     "Expense",
              //     "Income",
              //   ],
              //   minWidth: 150,
              //   minHeight: 60,
              //   cornerRadius: 30.0,
              //   activeBgColor: const [
              //     Colors.deepOrange,
              //   ],
              //   initialLabelIndex: selectedIndex,
              //   activeFgColor: Colors.white,
              //   inactiveBgColor: Colors.white,
              //   inactiveFgColor: Colors.black54,
              //   fontSize: 20,
              //   changeOnTap: false,
              //   onToggle: (index) {
              //     selectedIndex = index!;
              //     setState(() {
              //       if (selectedIndex == 1) {
              //         expenseSelected = false;
              //         incomeSelected = true;
              //         return;
              //       }
              //       if (selectedIndex == 0) {
              //         expenseSelected = true;
              //         incomeSelected = false;
              //         return;
              //       }
              //     });
              //   },
              // ),

              // Container(
              //   // color: Colors.white,
              //   margin: const EdgeInsets.all(20.0),
              //   child: TextField(
              //     controller: amountController,
              //     textAlign: TextAlign.center,
              //     style: const TextStyle(
              //       fontSize: 25.0,
              //       color: Colors.black87,
              //       fontWeight: FontWeight.w600,
              //     ),
              //     decoration: InputDecoration(
              //       label: const Align(
              //         alignment: Alignment.bottomCenter,
              //         child: Text(
              //           "\??? 0",
              //         ),
              //       ),
              //       floatingLabelBehavior: FloatingLabelBehavior.never,
              //       filled: true,
              //       fillColor: Colors.white,
              //       labelStyle: const TextStyle(
              //         color: Colors.deepOrange,
              //         fontSize: 30.0,
              //       ),
              //       hintStyle: const TextStyle(
              //         color: Colors.grey,
              //         fontSize: 20.0,
              //       ),
              //       hintText: "Eg.\???400",
              //       enabledBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(35.0),
              //         borderSide: BorderSide(
              //           style: BorderStyle.none,
              //           color: Theme.of(context).primaryColorLight,
              //           // width: 0.0,
              //         ),
              //       ),
              //       focusedBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(35.0),
              //         borderSide: BorderSide(
              //           color: Theme.of(context).primaryColor,
              //           style: BorderStyle.solid,
              //           width: 2.0,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              // //Categories
              // // if (expenseSelected)
              //   Container(
              //     height: 60.0,
              //     margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
              //     decoration: BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.circular(10.0),
              //     ),
              //     child: Row(
              //       children: [
              //         const SizedBox(width: 20.0),
              //         const Icon(
              //           Icons.category_outlined,
              //           size: 25.0,
              //           color: Colors.black54,
              //         ),
              //         const SizedBox(width: 20.0),
              //         DropdownButton(
              //           icon: const Icon(Icons.arrow_drop_down),
              //           iconSize: 30.0,
              //           value: category,
              //           style: const TextStyle(
              //             color: Colors.black54,
              //             fontSize: 20.0,
              //           ),
              //           onChanged: (String? newValue) {
              //             setState(() {
              //               category = newValue!;
              //             });
              //           },
              //           items:
              //               categories.map<DropdownMenuItem<String>>((value) {
              //             return DropdownMenuItem(
              //                 child: Text(value), value: value);
              //           }).toList(),
              //         ),
              //       ],
              //     ),
              //   ),
              //
              // Container(
              //   height: 60.0,
              //   margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(10.0),
              //   ),
              //   child: Row(
              //     children: [
              //       const SizedBox(width: 20.0),
              //       const Icon(Icons.note_add),
              //       const SizedBox(width: 20.0),
              //       // ignore: sized_box_for_whitespace
              //       Container(
              //         width: 200,
              //         child: TextField(
              //           controller: noteController,
              //           decoration: const InputDecoration(
              //             hintText: "Add Note",
              //             hintStyle: TextStyle(
              //               color: Colors.black54,
              //               fontSize: 20,
              //             ),
              //             enabledBorder: UnderlineInputBorder(
              //               borderSide: BorderSide(
              //                 style: BorderStyle.none,
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              //
              // GestureDetector(
              //   onTap: () {
              //     showDatePicker(
              //       context: context,
              //       initialDate: DateTime(2022, 01, 01),
              //       firstDate: DateTime(2022, 01, 01),
              //       lastDate: DateTime(2022, 12, 31),
              //     ).then((newDate) {
              //       setState(() {
              //         date = newDate!;
              //       });
              //     });
              //   },
              //   child: Container(
              //     height: 60.0,
              //     margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
              //     decoration: BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.circular(10.0),
              //     ),
              //     child: Row(
              //       children: [
              //         const SizedBox(width: 20.0),
              //         const Icon(
              //           Icons.calendar_today,
              //           size: 25.0,
              //           color: Colors.black54,
              //         ),
              //         const SizedBox(width: 10.0),
              //         Text(
              //           date != null
              //               ? DateFormat.yMd().format(date!)
              //               : "Pick the date",
              //           style: const TextStyle(
              //             color: Colors.black54,
              //             fontSize: 20.0,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   height: 20.0,
              // ),
              // Container(
              //   width: MediaQuery.of(context).size.width * 0.8,
              //   height: 60.0,
              //   alignment: Alignment.center,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(30.0),
              //     gradient: kGradient,
              //   ),
              //   child: TextButton(
              //     child: const Text(
              //       "Add Transaction",
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 20.0,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //     onPressed: _submitTransaction,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
