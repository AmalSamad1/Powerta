import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final formKey = GlobalKey<FormState>(); //key for form

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text("Labour Registration"),
          backgroundColor: Colors.indigoAccent,
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children:<Widget>[ Form(
            key: formKey, //key for form
            child:Column(children: [

              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Enter Name'
                ),
                validator: (value){
                  if(value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                    //allow upper and lower case alphabets and space
                    return "Enter Correct Name";
                  }else{
                    return null;
                  }
                },
              ),

              TextFormField(
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                ],
                decoration: InputDecoration(
                    labelText: 'Enter Phone Number'
                ),
                validator: (value){
                  if(value!.isEmpty || !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$').hasMatch(value)){
                    //  r'^[0-9]{10}$' pattern plain match number with length 10
                    return "Enter Correct Phone Number";
                  }else{
                    return null;
                  }
                },
              ),

              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Enter Email'
                ),
                validator: (value){
                  if(value!.isEmpty || !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)){
                    return "Enter Correct Email Address";
                  }else{
                    return null;
                  }
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Address'
                ),
                validator: (value){
                  if(value!.isEmpty || !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)){
                    return "Enter Correct Email Address";
                  }else{
                    return null;
                  }
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Site Name'
                ),
                validator: (value){
                  if(value!.isEmpty || !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$').hasMatch(value)){
                    return "Enter Site Name";
                  }else{
                    return null;
                  }
                },
              ),

              ElevatedButton(
                  onPressed: (){
                    if(formKey.currentState!.validate()){
                      //check if form data are valid,
                      // your process task ahed if all data are valid
                    }
                  },
                  child: Text("Submit Data")
              )

            ],
            ),
          ),
      ],
        )
    );
  }
}