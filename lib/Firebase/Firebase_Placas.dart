import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:refrimaq_placas_cadastrador/Cadastro_Pop_up/Placa.dart';
import 'package:refrimaq_placas_cadastrador/Components/Janela.dart';
import 'package:refrimaq_placas_cadastrador/Globals/Globals_TextController.dart';
import '../Globals/Global_Keys.dart';


class FirebasePlacas{
TextControllers controllers = TextControllers();
JanelaPopUp janela =JanelaPopUp();
Info info = Info();

streamPlacas (placa) {

  if (placa == null || placa == ""){

    return FirebaseFirestore.instance
        .collection('PLACA').snapshots();

  }

  else{

    return FirebaseFirestore.instance
        .collection('PLACA').where("arrayPlaca", arrayContains: placa.toUpperCase()).snapshots();

  }
}


void deletarPlacas(placa) async{

  await FirebaseFirestore.instance
      .collection("PLACA").doc(placa).delete();

}

void addPlacas ( Placa, Veiculo, Aparelho, Correia, Km, Cliente) async
{


  var arraySearch = [];
  String search ="";
  for (var i = 0; i < Placa.length; i++ ) {
    search = search + Placa.substring(i,i+1);
    arraySearch.add(search);
  }


  Map<String, dynamic>? map = {
    "Placa":Placa,
    "Veiculo": Veiculo,
    "Aparelho" : Aparelho,
    "Correia" :Correia,
    "KM": Km,
    "Cliente":Cliente,
    "arrayPlaca":arraySearch,
  };

    await FirebaseFirestore.instance
        .collection("PLACA")
        .doc(Placa)
        .set(map);


}

void editingPlaca(Placa,Veiculo, Aparelho, Correia, Km, Cliente, context){
  controllers.Placa.text = Placa;
  controllers.Veiculo.text = Veiculo;
  controllers.Aparelho.text = Aparelho;
  controllers.Correia.text = Correia;
  controllers.Km.text = Km;
  controllers.Cliente.text = Cliente;
  janela.Janela(context, PlacaCadastro());

}


}