



import 'package:flutter/material.dart';

class Info{
  static final Info _info = Info._internal();
 double? width;
 double? height;

 OverlayEntry? entry;

 var idPlaca;
 var idServices;

 bool isEditting = false;
 bool isPopUpOpened = false;










 factory Info() {return _info;}
  Info._internal();
}