import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/house1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //Padding(
              //  padding: EdgeInsets.only(
              //      top: MediaQuery.of(context).size.height * 0.4),
              //  child: Text(
              //    'Advertisements',
              //    style: TextStyle(
              //        color: Colors.white,
              //        fontSize: 24,
              //        fontWeight: FontWeight.bold),
              //  ),
              //),
              SizedBox(height: MediaQuery.of(context).size.height * 0.45),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blueGrey),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
