import 'package:flutter/material.dart';
import 'package:refrimaq_placas_cadastrador/Components/Janela.dart';


class FloatingButton extends StatelessWidget {
  const FloatingButton({Key? key, required this.janela}) : super(key: key);

  final janela;

  @override
  Widget build(BuildContext context) {
    JanelaPopUp janelaPopUp = JanelaPopUp();
    return FloatingActionButton(
      onPressed: (){ janelaPopUp.Janela(context,janela); },
      child: const Icon(Icons.add),
    );
  }
}
