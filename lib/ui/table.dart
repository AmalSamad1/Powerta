import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:money_management/ui/text.dart';
import '../api/pdf_api.dart';
import '../api/pdf_invoice_api.dart';
import '../models/customer.dart';
import '../models/invoice.dart';
import '../models/supplier.dart';
import 'chumma.dart';
class Expense extends StatefulWidget {
  const Expense({Key? key}) : super(key: key);

  @override
  State<Expense> createState() => _ExpenseState();
}
List<String>ledgerList=[
  "Amal","Salman","Anas",
];
bool checkboxValue = false;
List productList = [

];
List<String>productcategaory=["Petrol","Rent","Salary","Tea","Transport"];
final GlobalKey<ScaffoldState> _drawerKey = new GlobalKey<ScaffoldState>();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

String _invoiceNumber = Random().nextInt(1000).toString();
String _masterId = Random().nextInt(1000  ).toString();
// Customer details
String?_customerLedger;
String _customerName = '';
String _customerGst = '';
String _customerPhone = '';
String _customerMasterId = '';
// Product details
List<String> _inventoryEntries = [];
String _productName = '';
String _gstType = '';
String? _gstPercentage;
String? _productPrice;
String? _productQuantity;
double? _totalProductPrice = 0;
double _totalTax = 0;
double _totalAmount = 0;

DateTime _invoiceDateRaw = DateTime.now();
String _currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
String _dueDate = DateFormat('dd-MM-yyyy')
    .format(DateTime.now().add(new Duration(days: 30)));
bool isCashSwitched =true;

cashCredit(bool isCashSwitched) {
  if (isCashSwitched == true) {
    return Text(
      'Cash',
      style: secondaryListDisc.copyWith(color: TassistMenuBg),
    );
  } else {
    return Text('Cheque',
        style: secondaryListDisc.copyWith(color: TassistInfoGrey));
  }
}

class _ExpenseState extends State<Expense> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: TassistMenugreen,
          onPressed: () async {
        final date = DateTime.now();
        final dueDate = date.add(Duration(days: 7));

        final invoice = Invoice(
        supplier:Supplier(
        name: 'Sarah Field',
        address: 'Sarah Street 9, Beijing, China',
        paymentInfo: 'https://paypal.me/sarahfieldzz',
        ),
        customer: Customer(
        name: 'Apple Inc.',
        address: 'Apple Street, Cupertino, CA 95014',
        ),
        info: InvoiceInfo(
        date: date,
        dueDate: dueDate,
        description: 'My description...',
        number: '${DateTime.now().year}-9999',
        ),
        items: [
        InvoiceItem(
        description: 'Coffee',
        date: DateTime.now(),
        quantity: 3,
        vat: 0.19,
        unitPrice: 5.99,
        ),
        InvoiceItem(
        description: 'Water',
        date: DateTime.now(),
        quantity: 8,
        vat: 0.19,
        unitPrice: 0.99,
        ),
        InvoiceItem(
        description: 'Orange',
        date: DateTime.now(),
        quantity: 3,
        vat: 0.19,
        unitPrice: 2.99,
        ),
        InvoiceItem(
        description: 'Apple',
        date: DateTime.now(),
        quantity: 8,
        vat: 0.19,
        unitPrice: 3.99,
        ),
        InvoiceItem(
        description: 'Mango',
        date: DateTime.now(),
        quantity: 1,
        vat: 0.19,
        unitPrice: 1.59,
        ),
        InvoiceItem(
        description: 'Blue Berries',
        date: DateTime.now(),
        quantity: 5,
        vat: 0.19,
        unitPrice: 0.99,
        ),
        InvoiceItem(
        description: 'Lemon',
        date: DateTime.now(),
        quantity: 4,
        vat: 0.19,
        unitPrice: 1.29,
        ),
        ],
        );

        final pdfFile = await PdfInvoiceApi.generate(invoice);

        PdfApi.openFile(pdfFile);
        },
          child: const Icon(Icons.done, color: Colors.black,),
        ),
        appBar: AppBar(
          title: Text("Expense", style: TextStyle(color: Colors.black),),
          backgroundColor: TassistMenugreen,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
        ),
        body: ListView(children: [Column(
          children: [
            Card(child:
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: Text("Expense No.", style: TextStyle(
                        fontWeight: FontWeight.w800,)),
                      subtitle: Text('#$_invoiceNumber', style: TextStyle(
                        fontWeight: FontWeight.w800,
                      )),
                      trailing: Icon(Icons.arrow_downward,color: TassistMenuBg),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    color: Colors.grey.withOpacity(0.4),
                    width: 1,
                  ), // THE DIVIDER. CHANGE THIS TO ACCOMMODATE YOUR NEEDS
                  Expanded(
                    child:
                    ListTile(
                      title: Text("Date", style: TextStyle(
                        fontWeight: FontWeight.w800,)),
                      subtitle: Text(_currentDate, style: TextStyle(
                        fontWeight: FontWeight.w800,
                      )),
                      trailing: Icon(Icons.date_range, color: TassistMenuBg,),
                    ),
                  ),
                ],
              ),
            ),
            ),
            SizedBox(width: 10),
            Card(child:
            Container(
              height: 650,
              child: Column(
                  children: <Widget>[
                    SizedBox(height: 50),
                    Padding(padding: EdgeInsets.all(15),
                      child:
                      DropdownButtonFormField(
                        // keyboardType: TextInputType.emailAddress,
                        // textInputAction: TextInputAction.next,
                        items: ledgerList.map((l) {
                          return DropdownMenuItem(
                            child: Text(l),
                            value: l,
                          );
                        }).toList(), onChanged: (String? val) {
                        setState(() {
                          _customerLedger = val;
                          _customerMasterId = val!;
                          _customerName = val!;
                          _customerGst = (val!);
                          _customerPhone = (val);
                        });
                      },

                        decoration: InputDecoration(
                          labelText: "Party",
                          labelStyle: TextStyle(color: TassistMenuBg),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: TassistMenuBg
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: TassistMenuBg
                            ),
                          ),
                          hintText: "party",
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(padding: EdgeInsets.all(15),
                      child:
                      DropdownButtonFormField(
                        // keyboardType: TextInputType.emailAddress,
                        // textInputAction: TextInputAction.next,
                        items:
                        productcategaory.map((p) {
                          return DropdownMenuItem(
                            child: Text(p),
                            value: p,
                          );
                        }
                        ).toList(),
                        onChanged: (String? val) {
                          setState(() => _productName = val.toString());
                        },
                        decoration: InputDecoration(
                          labelText: "Expense Category",
                          labelStyle: TextStyle(color: TassistMenuBg),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: TassistMenuBg
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: TassistMenuBg
                            ),
                          ),
                          hintText: "expense category",

                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(15),
                      child:
                      TextField(
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          labelText: "Amount",
                          labelStyle: TextStyle(color: TassistMenuBg),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: TassistMenuBg
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: TassistMenuBg
                            ),
                          ),
                          hintText: "Amount",
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(15),
                      child:
                      TextField(
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          labelText: "Description",
                          labelStyle: TextStyle(color: TassistMenuBg),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: TassistMenuBg
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: TassistMenuBg
                            ),
                          ),
                          hintText: "Description",
                        ),
                      ),
                    ),
                    Container(
                      height: 200,
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(padding: EdgeInsets.all(5),
                              child:
                              TextField(
                                keyboardType: TextInputType.multiline,
                                maxLines: 4,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                  labelText: "Description",
                                  labelStyle: TextStyle(color: TassistMenuBg),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: TassistMenuBg
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: TassistMenuBg
                                    ),
                                  ),
                                  hintText: "Add Note",
                                ),
                              ),
                            ),
                          ),
                           // THE DIVIDER. CHANGE THIS TO ACCOMMODATE YOUR NEEDS

                             Padding(padding: EdgeInsets.all(25),
                              child:
                              InkWell(onTap: ()=>null,
                                child:
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Column(children:[
                                    SizedBox(height: 20,),
                                    Icon(
                                    Icons.add_photo_alternate_outlined,
                                    color: Colors.black,
                                    size: 30.0,
                                  ),
                                    Text("Add Image"),
    ],
                                  ),

                                ),
                              ),
                            ),

                        ],
                      ),
                    ),

                  ]
              ),
            ),
            ),
          ],
        )
        ]
        )
    );
  }

  File? file;

  pickImage() async {

  }
}



