import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:refrimaq_placas_cadastrador/Globals/Globals_TextController.dart';


class FirebasePlacas{
TextControllers controllers = TextControllers();


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


}