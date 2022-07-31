import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:refrimaq_placas_cadastrador/Globals/Global_Keys.dart';


class FirebaseServices{
  Info info = Info();
  
  void addServices (map) async {
    if (!info.isEditting) {
      await FirebaseFirestore.instance
          .collection("PLACA")
          .doc(info.idPlaca).collection("Services").doc().set(map);
    }
    else{
      await FirebaseFirestore.instance
          .collection("PLACA")
          .doc(info.idPlaca).collection("Services").doc(info.idServices).set(map);
            info.isEditting = false;
    }
}

  void deletarServices(services) async{

    await FirebaseFirestore.instance
        .collection("PLACA").doc(info.idPlaca).collection("Services").doc(services).delete();

  }

streamServices (Placa) {
    return FirebaseFirestore.instance.collection("PLACA").doc(Placa).collection("Services").snapshots();
}
  
  
  
}