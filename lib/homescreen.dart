import 'package:flutter/material.dart';

import 'constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'HomeScreen',
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Text('hello', style: TextStyle(fontSize: 20),),
           h_size50,
           ElevatedButton(
             style: ElevatedButton.styleFrom(
                 minimumSize: Size(400, 60),
                 primary: kPrimaryColor,
                 onPrimary: Colors.white,
                 shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(30))),
             onPressed: () async{

             },
             child: Text(
               'Logout',
               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
             ),
           ),
         ],
       ),
      ),
    );
  }
}
