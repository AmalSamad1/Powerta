import 'package:flutter/material.dart';
import 'package:money_management/ui/payment_in.dart';
import 'package:money_management/ui/payment_out.dart';
import 'package:money_management/ui/table.dart';

import 'Labour_View.dart';
import 'Purchase.dart';
import 'chumma.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Name',style: TextStyle(color: Colors.black),),
            accountEmail: Text('example@gmail.com',style: TextStyle(color: Colors.black)),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: TassistMenugreen,
              // image: DecorationImage(
              //     fit: BoxFit.fill,
              //     image: NetworkImage(
              //         'https://firebasestorage.googleapis.com/v0/b/new-web-b1c51.appspot.com/o/1234.png?alt=media&token=aec89e86-9a63-4bb7-9b5a-5c879adbce27')),
            ),
          ),
          ListTile(
            leading: Icon(Icons.file_copy_outlined),
            title: Text('Labour'),
            onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (c)=>LabourView()));},
          ),
          ListTile(
            leading: Icon(Icons.add_shopping_cart_outlined),
            title: Text('Purchase'),
            onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (c)=>Purchase()));}
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Payment-In'),
            onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (c)=>PaymentIn()));},
          ),
          ListTile(
            leading: Icon(Icons.payment_rounded),
            title: Text('Payment-Out'),
            onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (c)=>PaymentOut()));},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.keyboard_return),
            title: Text('Dr.Note/Purchase Return'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('Cr.Note/Sale Return'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            title: Text('Expense'),
            leading: Icon(Icons.account_balance_wallet),
            onTap: () =>{Navigator.of(context).push(MaterialPageRoute(builder: (c)=>Expense()))},
          ),
          ListTile(
            title: Text('Settings'),
            leading: Icon(Icons.settings),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}