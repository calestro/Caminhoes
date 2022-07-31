import 'package:flutter/material.dart';
import 'package:refrimaq_placas_cadastrador/Globals/Global_Keys.dart';
import 'package:refrimaq_placas_cadastrador/Globals/Globals_TextController.dart';

class JanelaPopUp{
  Info info = Info();
  TextControllers n = TextControllers();

  Janela(context,retorno){
    info.entry = OverlayEntry(
        builder: (context)
        {

          var width  = MediaQuery.of(context).size.width;

          return Container(
            width: width * 0.4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: width * 0.4,
                  decoration: BoxDecoration(
                      color: Color(0xff101c43),
                      borderRadius: BorderRadius.circular(8.0)
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton.icon(
                        icon: Icon(Icons.close, color: Colors.white,),
                        label: Text(""),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            textStyle:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                        onPressed: Close,
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    child: SingleChildScrollView(
                      child: retorno,
                    ),
                  ),
                ),
              ],
            ),
          );
        });

    final flutuante = Overlay.of(context)!;
   flutuante.insert(info.entry!);

  }


  void Close(){
    info.entry?.remove();
    info.entry = null;
    n.clear();
  }
}



