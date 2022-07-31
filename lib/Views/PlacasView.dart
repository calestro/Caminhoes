import 'package:flutter/material.dart';
import 'package:refrimaq_placas_cadastrador/Cadastro_Pop_up/Placa.dart';
import 'package:refrimaq_placas_cadastrador/Components/AppBar.dart';
import 'package:refrimaq_placas_cadastrador/Components/Floating_Button.dart';
import 'package:refrimaq_placas_cadastrador/Components/Search_Bar.dart';
import 'package:refrimaq_placas_cadastrador/Firebase/stream_list_placas.dart';
import 'package:refrimaq_placas_cadastrador/Firebase/Firebase_Placas.dart';
import 'package:refrimaq_placas_cadastrador/Globals/Global_Keys.dart';



class PlacasView extends StatefulWidget {
  const PlacasView({Key? key}) : super(key: key);
  @override
  State<PlacasView> createState() => _PlacasViewState();
}

class _PlacasViewState extends State<PlacasView> {
  Info info = Info();

  @override
  Widget build(BuildContext context) {

    info.width = MediaQuery.of(context).size.width;    //pasando o tamanhos para o global
    info.height = MediaQuery.of(context).size.height;
    FirebasePlacas firebase = FirebasePlacas();


    return Scaffold(                     //conf geral
      backgroundColor: Color(0xff05103a),
      appBar:  appBarCustomer(),
      body: Container(
        width: info.width,
        height: info.height,
        child: Column(
          mainAxisSize: MainAxisSize.max,
         crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.only(top: info.height! * 0.02),
                child:SearchBar(),
            ),
            const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: StreamListPlaca()),
            ),

          ],
        ),
      ),
      floatingActionButton:FloatingButton(janela: PlacaCadastro()),
    );
  }
}
