import 'package:flutter/material.dart';
import 'package:refrimaq_placas_cadastrador/Cadastro_Pop_up/Services.dart';
import 'package:refrimaq_placas_cadastrador/Components/AppBar.dart';
import 'package:refrimaq_placas_cadastrador/Components/Floating_Button.dart';
import 'package:refrimaq_placas_cadastrador/Components/TextServices.dart';
import 'package:refrimaq_placas_cadastrador/Firebase/stream_list_services.dart';
import 'package:refrimaq_placas_cadastrador/Globals/Global_Keys.dart';
import 'package:refrimaq_placas_cadastrador/Components/Floating_Button.dart';

class ServicesView extends StatefulWidget {
  const ServicesView({Key? key, required this.click}) : super(key: key);
final Map<String,dynamic> click;
  @override
  State<ServicesView> createState() => _ServicesViewState();
}

class _ServicesViewState extends State<ServicesView> {
  @override
  Widget build(BuildContext context) {
    Info info = Info();

    return Scaffold(
        backgroundColor: Color(0xff05103a),
        appBar: appBarCustomer(),
        body: Column(mainAxisSize: MainAxisSize.max,
            children: [
          Container(
            color: Color(0xff143168),
            width: double.infinity,
            height: 40,
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: TextServicesTopo(text: "Veiculo ", textInfo: widget.click["Veiculo"])
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 8, left: MediaQuery.of(context).size.width * 0.18),
                    child: TextServicesTopo(text: "Cliente ", textInfo: widget.click["Cliente"])
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Color(0xff268094),
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextServiceMiddle(text: "Tipo de Correia", textInfo: widget.click["Correia"]),
                TextServiceMiddle(text: "Tipo do Aparelho", textInfo: widget.click["Aparelho"]),
                TextServiceMiddle(text: "KM", textInfo: widget.click["Km"]),
              ],
            ),
          ),
              StreamListServices(Placa: widget.click["Placa"]),

        ]),
    floatingActionButton: FloatingButton(janela: ServiceCadastro()),
    );
  }
}
