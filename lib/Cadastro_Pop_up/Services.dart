import 'package:flutter/material.dart';
import 'package:refrimaq_placas_cadastrador/Components/Janela.dart';
import 'package:refrimaq_placas_cadastrador/Components/Text_Field_Cadastro.dart';
import 'package:refrimaq_placas_cadastrador/Globals/Globals_TextController.dart';
import 'package:refrimaq_placas_cadastrador/Firebase/Firebase_Services.dart';



class ServiceCadastro extends StatefulWidget {
  const ServiceCadastro({Key? key}) : super(key: key);

  @override
  State<ServiceCadastro> createState() => _ServiceCadastroState();
}



class _ServiceCadastroState extends State<ServiceCadastro> {

  var buttonEnable = true;
  JanelaPopUp janela = JanelaPopUp();
  FirebaseServices firebase = FirebaseServices();

  @override
  Widget build(BuildContext context) {

    var wd = MediaQuery.of(context).size.width;
    var hg = MediaQuery.of(context).size.height;
    TextControllers n = TextControllers();

    return Container(
      width: wd * 0.4,
      child: Material(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: hg * 0.02),

            Text("Cadastrar Serviço",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            SizedBox(height: hg * 0.02),
            // peça
            TextFieldCadastro(size: wd * 0.19, controller: n.Peca, hintText: "Nome Da Peca"),
            SizedBox(height: hg * 0.02),

            //Descrição
            TextFieldCadastro(size: wd * 0.19, controller: n.Desc, hintText: "Descrição", isMultiline: true),
            SizedBox(height: hg * 0.02),

            //Data
            TextFieldCadastro(size: wd * 0.19, controller: n.Date, hintText: "Data", isDate: true),
            SizedBox(height: hg * 0.02),

            //Botão de Salvar
            Container(
              height: hg * 0.08,
              width: wd * 0.08,
              child: IconButton(
                onPressed: buttonEnable ? (){

                  Map<String,dynamic> map = {
                    "Peca":n.Peca.text,
                    "Desc":n.Desc.text,
                    "Date": n.Date.text,
                  };
                  firebase.addServices(map);
                  janela.Close();

                } : null,
                icon: Icon(
                  Icons.save,
                  size: wd * 0.03,
                ),

              ),
            )

          ],
        ),
      ),
    );

  }

}
