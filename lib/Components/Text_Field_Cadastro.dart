import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';



class TextFieldCadastro extends StatelessWidget {
 TextFieldCadastro({Key? key, required this.size, required this.controller, required this.hintText,this.isMultiline = false, this.isDate = false}) : super(key: key);
  final double size;
  final TextEditingController controller;
  final String hintText;
  bool isMultiline;
  bool isDate;


  @override
  Widget build(BuildContext context) {
    var date = new MaskTextInputFormatter(
        mask: '##/##/####',
        filter: { "#": RegExp(r'[0-9]') },
        type: MaskAutoCompletionType.lazy
    );

    return Container(
      width: size,
      child: TextField(
        controller: controller,
        keyboardType: isMultiline ? TextInputType.multiline : TextInputType.text,
        maxLines: isMultiline ? 5 : 1,
        inputFormatters: isDate ? [date] : null,
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: Color(0xFFbdcfe7),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
}
