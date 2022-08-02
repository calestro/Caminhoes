import 'package:flutter/material.dart';
import 'package:refrimaq_placas_cadastrador/Firebase/Firebase_Placas.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:refrimaq_placas_cadastrador/Globals/Global_Keys.dart';
import 'package:refrimaq_placas_cadastrador/Globals/Globals_TextController.dart';
import 'package:refrimaq_placas_cadastrador/Views/ServicesView.dart';



class StreamListPlaca extends StatefulWidget {
 const StreamListPlaca({Key? key,}) : super(key: key);



  @override
  State<StreamListPlaca> createState() => _StreamListPlacaState();
}

class _StreamListPlacaState extends State<StreamListPlaca> {

  FirebasePlacas firebase = FirebasePlacas();
  TextControllers n = TextControllers();
  Info info = Info();

  @override
  void initState() {
    n.Search.addListener(() {setState((){});});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder <QuerySnapshot>(
      stream: firebase.streamPlacas(n.Search.text),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
          default:
            return ListView.builder(
              itemCount: snapshot.data!.size,
              itemBuilder: (context, index) {
                return Column(children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xff268094),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(color: Color(0xff125e6f), spreadRadius: 2),
                      ],
                    ),
                    child: GestureDetector(
                      onLongPress: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: new Text("Alerta"),
                              content: new Text("Deseja Excluir ?"),
                              actions: <Widget>[
                                // define os botões na base do dialogo
                                ElevatedButton(
                                  child: Text("Sim"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    firebase.deletarPlacas(snapshot.data!.docs[index]["Placa"].toString().toUpperCase());
                                    },
                                ),
                                ElevatedButton(
                                  child: Text("Não"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    child: ListTile(
                      title: Text(
                         snapshot.data!.docs[index]["Placa"],
                          style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      subtitle: Text(
                        snapshot.data!.docs[index]["Veiculo"],
                          style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      trailing: IconButton(
                        icon:Icon(Icons.edit),
                        onPressed:(){ firebase.editingPlaca(
                            snapshot.data!.docs[index]["Placa"],
                            snapshot.data!.docs[index]["Veiculo"],
                            snapshot.data!.docs[index]["Aparelho"],
                            snapshot.data!.docs[index]["Correia"],
                            snapshot.data!.docs[index]["KM"],
                            snapshot.data!.docs[index]["Cliente"],
                            context);
                          info.isEditting = true;
                        }
                      ),

                      onTap: () {
                        var snap = snapshot.data!.docs[index];
                        Map<String,dynamic> click = {
                          "Placa":snap["Placa"],
                          "Veiculo":snap["Veiculo"],
                          "Aparelho":snap["Aparelho"],
                          "Correia":snap["Correia"],
                          "Km":snap["KM"],
                          "Cliente":snap["Cliente"]
                        };
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ServicesView(click: click)),
                        );
                        info.idPlaca = snap["Placa"];
                      },
                    ),
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  )
                ]);
              },
            );
        }
      },
    );
  }
}
