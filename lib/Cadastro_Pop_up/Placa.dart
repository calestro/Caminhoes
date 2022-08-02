import 'package:flutter/material.dart';
import 'package:refrimaq_placas_cadastrador/Components/Janela.dart';
import 'package:refrimaq_placas_cadastrador/Components/Text_Field_Cadastro.dart';
import 'package:refrimaq_placas_cadastrador/Firebase/Firebase_Placas.dart';
import 'package:refrimaq_placas_cadastrador/Globals/Global_Keys.dart';
import 'package:refrimaq_placas_cadastrador/Globals/Globals_TextController.dart';



class PlacaCadastro extends StatefulWidget {
  const PlacaCadastro({Key? key}) : super(key: key);

  @override
  State<PlacaCadastro> createState() => _PlacaCadastroState();
}

class _PlacaCadastroState extends State<PlacaCadastro> {

  FirebasePlacas firebase = FirebasePlacas();
  TextControllers n = TextControllers();
  bool textPlacaActive = false;
  bool textVeiculoActive = false;
  bool textAparelhoActive = false;
  bool textKmActive = false;
  bool textCorreiaActive = false;
  bool textClienteActive= false;
  bool buttonEnable = false;


  @override
  void initState() {
   n.Placa.addListener(() {
     if(n.Placa.text.isNotEmpty){ textPlacaActive = true; }
     else{ textPlacaActive = false; }
     EnableButton();
   });
   n.Cliente.addListener(() {
     if(n.Cliente.text.isNotEmpty){ textClienteActive = true; }
     else{ textClienteActive = false; }
     EnableButton();
   });
   n.Aparelho.addListener(() {
     if(n.Aparelho.text.isNotEmpty){ textAparelhoActive = true; }
     else{ textAparelhoActive = false; }
     EnableButton();
   });
   n.Km.addListener(() {
     if(n.Km.text.isNotEmpty){ textKmActive = true; }
     else{ textKmActive = false; }
     EnableButton();
   });
   n.Correia.addListener(() {
     if(n.Correia.text.isNotEmpty){ textCorreiaActive = true; }
     else{ textCorreiaActive = false; }
     EnableButton();
   });
   n.Veiculo.addListener(() {
     if(n.Veiculo.text.isNotEmpty){ textVeiculoActive = true; }
     else{ textVeiculoActive = false; }
     EnableButton();
   });
   super.initState();
  }

  void EnableButton(){
    if(textPlacaActive & textVeiculoActive & textAparelhoActive & textKmActive & textCorreiaActive & textClienteActive)
    {
      setState(() {
        //colorButton = Colors.blue;
        buttonEnable = true;
      });
    }
    else
    {
      setState(() {
        //colorButton = Colors.grey;
        buttonEnable = false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {

    bool buttonSaveEnable = false;
    var wd = MediaQuery.of(context).size.width;
    var hg = MediaQuery.of(context).size.height;

    Info info = Info();

    return Container(
      width: wd * 0.4,
      child: Material(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: hg * 0.02),

            Text("Cadastrar Novo Veiculo",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            SizedBox(height: hg * 0.02),

            // Placa
           TextFieldCadastro(size: wd * 0.3, controller: n.Placa, hintText: "Placa"),
            SizedBox(height: hg * 0.02),

            //Veiculo
            TextFieldCadastro(size: wd * 0.3, controller: n.Veiculo, hintText: "Veiculo"),
            SizedBox(height: hg * 0.02),

            //Aparelho
            TextFieldCadastro(size: wd * 0.3, controller: n.Aparelho, hintText: "Aparelho"),
            SizedBox(height: hg * 0.02),

            //Km e Correia
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                TextFieldCadastro(size: wd * 0.14, controller: n.Km, hintText: "KM"),
                SizedBox(width: wd * 0.02),
                TextFieldCadastro(size: wd * 0.14, controller: n.Correia, hintText: "Correia"),
              ],
            ),
            SizedBox(height: hg * 0.02),
            TextFieldCadastro(size: wd * 0.14, controller: n.Cliente, hintText: "Cliente"),

            SizedBox(height: hg * 0.02),

            //Botão de Salvar
            Container(
              height: hg * 0.08,
              width: wd * 0.08,
              child: IconButton(
                icon: Icon(Icons.save, size: wd * 0.03),
                onPressed: buttonEnable || info.isEditting ? (){
                 firebase.addPlacas(n.Placa.text.toUpperCase(),n.Veiculo.text.toUpperCase(),n.Aparelho.text.toUpperCase(),n.Correia.text.toUpperCase(),n.Km.text.toUpperCase(), n.Cliente.text.toUpperCase());
                 JanelaPopUp().Close();
                } : null,
              ),
            ),


          ],
        ),
      ),
    );
  }


}

