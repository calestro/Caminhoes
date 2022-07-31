import 'package:flutter/material.dart';


class TextServicesTopo extends StatelessWidget {
  TextServicesTopo({Key? key, required this.text,required this.textInfo, this.color }) : super(key: key);
  final String text;
  final String textInfo;
  var color;

  @override
  Widget build(BuildContext context) {

    if(color == null){ color = Colors.white; }

    return  Text(text + textInfo,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ));
  }
}


class TextServiceMiddle extends StatelessWidget {
  const TextServiceMiddle({Key? key, required this.text, required this.textInfo }) : super(key: key);
  final String text;
  final String textInfo;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(text,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17)),
          SizedBox(
            height: 7,
          ),
          Text(textInfo,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17)),
        ],
      ),
    );
  }
}
