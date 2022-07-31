import 'package:flutter/material.dart';
import 'package:refrimaq_placas_cadastrador/Views/PlacasView.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Firebase/firebase_options.dart';

void main() async{

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  runApp(MaterialApp(
    home:PlacasView(),
  ));



}