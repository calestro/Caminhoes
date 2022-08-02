import 'package:flutter/material.dart';
import 'package:refrimaq_placas_cadastrador/Components/Janela.dart';
import 'package:refrimaq_placas_cadastrador/Globals/Global_Keys.dart';


class FloatingButton extends StatelessWidget {
  const FloatingButton({Key? key, required this.janela}) : super(key: key);

  final janela;

  @override
  Widget build(BuildContext context) {
    JanelaPopUp janelaPopUp = JanelaPopUp();
    Info info = Info();
    return FloatingActionButton(
      onPressed: (){ janelaPopUp.Janela(context,janela); info.isPopUpOpened = true;},
      child: const Icon(Icons.add),
    );
  }
}
