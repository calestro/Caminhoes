



import 'package:flutter/material.dart';

class Info{
  static final Info _info = Info._internal();
 double? width;
 double? height;
 OverlayEntry? entry;
 var idPlaca;
 bool isEditting = false;
 var idServices;









 factory Info() {return _info;}
  Info._internal();
}