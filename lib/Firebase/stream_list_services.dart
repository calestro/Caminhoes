import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:refrimaq_placas_cadastrador/Cadastro_Pop_up/Services.dart';
import 'package:refrimaq_placas_cadastrador/Components/Janela.dart';
import 'package:refrimaq_placas_cadastrador/Firebase/Firebase_Services.dart';
import 'package:refrimaq_placas_cadastrador/Globals/Global_Keys.dart';
import 'package:refrimaq_placas_cadastrador/Globals/Globals_TextController.dart';



class StreamListServices extends StatefulWidget {
  const StreamListServices({Key? key, required this.Placa}) : super(key: key);
final Placa;
  @override
  State<StreamListServices> createState() => _StreamListServicesState();
}

class _StreamListServicesState extends State<StreamListServices> {
  @override
  Widget build(BuildContext context) {
    var hg = MediaQuery.of(context).size.height;
    FirebaseServices firebase = FirebaseServices();
    JanelaPopUp janela = JanelaPopUp();
    TextControllers n = TextControllers();
    Info info = Info();


    return StreamBuilder<QuerySnapshot>(
      stream: firebase.streamServices(widget.Placa),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
          default:
            if(snapshot.data!.docs.isEmpty){
              return Expanded(
                child: Center(
                  child: Text("Sem Serviços"),
                ),
              );
            }
            else {
              return Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data!.size,
                  itemBuilder: (context, index) =>
                      Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: hg * 0.03),
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0x22157897),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(color: Color(0xff143168), spreadRadius: 2),
                                ],
                              ),
                              child: GestureDetector(
                                onLongPress: (){
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: new Text("Alerta"),
                                        content: new Text("Deseja Excluir ?"),
                                        actions: <Widget>[
                                          // define os botões na base do dialogo
                                          ElevatedButton(
                                            child:Text("Sim"),
                                            onPressed: () {
                                              firebase.deletarServices(snapshot.data!.docs[index].id.toString());
                                              Navigator.of(context).pop();
                                              },
                                          ),
                                          ElevatedButton(
                                            child:Text("Não"),
                                            onPressed: () {Navigator.of(context).pop();},
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: ListTile(
                                  title: Text(
                                      snapshot.data!.docs[index]["Peca"],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white)),
                                  subtitle: Text(snapshot.data!.docs[index]["Date"],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white)),
                                  onTap: () {
                                    n.Peca.text = snapshot.data!.docs[index]["Peca"];
                                    n.Date.text =snapshot.data!.docs[index]["Date"];
                                    n.Desc.text =snapshot.data!.docs[index]["Desc"];
                                    info.isEditting = true;
                                    info.idServices = snapshot.data!.docs[index].id.toString();
                                    janela.Janela(context, ServiceCadastro());
                                    },
                                ),
                              ),
                            ),
                          ]),
                ),
              );
            }
        }

      },
    );
  }
}
