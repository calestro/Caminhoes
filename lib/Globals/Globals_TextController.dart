import "package:flutter/material.dart";



class TextControllers{
  static final TextControllers _textControllers = TextControllers._internal();



  TextEditingController Search = TextEditingController();
  TextEditingController Placa = TextEditingController();
  TextEditingController Veiculo = TextEditingController();
  TextEditingController Aparelho = TextEditingController();
  TextEditingController Km = TextEditingController();
  TextEditingController Correia = TextEditingController();
  TextEditingController Cliente = TextEditingController();
  TextEditingController Date = TextEditingController();
  TextEditingController Peca = TextEditingController();
  TextEditingController Desc = TextEditingController();




  factory TextControllers() {return _textControllers;}
  TextControllers._internal();


  void clear(){
    Placa.clear();
    Veiculo.clear();
    Aparelho.clear();
    Km.clear();
    Correia.clear();
    Cliente.clear();
    Peca.clear();
    Desc.clear();
    Date.clear();
  }

}
