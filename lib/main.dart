// import Google's Material Design library
import 'package:flutter/material.dart';
import './pages/intro.dart';

// Entry point of the app
void main()  {
   runApp(
  new MaterialApp(
     debugShowCheckedModeBanner: false,
    title: "LightBurst",
    theme: ThemeData(fontFamily: 'Heebo'),
    home: new Intro(),
  )
  );
  }
   
