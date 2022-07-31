import 'package:flutter/material.dart';
import 'package:refrimaq_placas_cadastrador/Globals/Globals_TextController.dart';



class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    var iconList = [Icons.add,Icons.abc];
    TextControllers n = TextControllers();
    return  SizedBox(
      width: 300,                //nao esquecer de mudar o tamanho para ficar responsivo
      child: TextField(
        controller:n.Search ,
        cursorColor: Colors.blue,
        autofocus: true,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
          ),
          hintText: "Pesquisar...",
          focusColor: Colors.white,
          //suffixIcon:
        ),
      ),
    );
  }
}
