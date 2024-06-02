import 'package:flutter/material.dart';
import 'package:mybca_prototype/utils/string_const.dart';

Widget widgetFont(String text, String styles) {
  late FontWeight fontWeight;
  late double fontSize;
  late Color color;

  if (styles == title1) {
    color = Colors.black;
    fontWeight = FontWeight.bold;
    fontSize = 23;
    //end of title1
  } else if (styles == title2) {
    color = Colors.black;
    fontWeight = FontWeight.normal;
    fontSize = 20;
    //end of title2
  } else if (styles == title3) {
    color = Colors.white;
    fontWeight = FontWeight.normal;
    fontSize = 30;
    //end of title2
  }else if (styles == title4) {
    color = Colors.white;
    fontWeight = FontWeight.normal;
    fontSize = 20;
    //end of title2
  }else if (styles == title5) {
    color = Colors.white;
    fontWeight = FontWeight.normal;
    fontSize = 23;
    //end of title2
  } else if (styles == heading1) {
    color = Colors.black54;
    fontWeight = FontWeight.bold;
    fontSize = 18;
    //end of heading1
  } else if (styles == heading2) {
    color = Colors.grey;
    fontWeight = FontWeight.bold;
    fontSize = 18;
    //end of heading2
  } else if (styles == heading3) {
    color = Colors.white;
    fontWeight = FontWeight.bold;
    fontSize = 18;
    //end of heading3
  }else if (styles == heading4) {
    color = Colors.black87;
    fontWeight = FontWeight.bold;
    fontSize = 16;
    //end of heading3
  }else if (styles == normal1) {
    color = Colors.white;
    fontWeight = FontWeight.bold;
    fontSize = 15;
    //end of normal1
  }else if (styles == normal2) {
    color = Colors.white;
    fontWeight = FontWeight.normal;
    fontSize = 15;
    //end of normal1
  }else if (styles == normal3) {
    color = Color(0xFF4D4D4D);
    fontWeight = FontWeight.bold;
    fontSize = 16;
    //end of normal1
  }else if (styles == normal4) {
    color = Colors.white;
    fontWeight = FontWeight.normal;
    fontSize = 12;
    //end of normal1
  }else if (styles == jumbo1) {
    color = Colors.white;
    fontWeight = FontWeight.bold;
    fontSize = 30;
    //end of normal1
  }else if (styles == jumbo2) {
    color = const Color(0xFF0060AF);
    fontWeight = FontWeight.bold;
    fontSize = 30;
    //end of normal1
  }else if (styles == jumbo3) {
    color = Colors.white;
    fontWeight = FontWeight.bold;
    fontSize = 23;
    //end of normal1
  }else if (styles == blue) {
    color = const Color(0xFF387BFF);
    fontWeight = FontWeight.bold;
    fontSize = 23;
    //end of normal1
  }else if (styles == blue2) {
    color = const Color(0xFF0060AF);
    fontWeight = FontWeight.bold;
    fontSize = 23;
    //end of normal1
  }else if (styles == orange) {
    color = const Color(0xFFEF6A2A);
    fontWeight = FontWeight.normal;
    fontSize = 13;
    //end of normal1
  }else {
    color = Colors.black54;
    fontWeight =
    double.parse(styles) > 20 ? FontWeight.bold : FontWeight.normal;
    fontSize = double.parse(styles);
  }
  return Text(text,
      style:
      TextStyle(fontWeight: fontWeight, fontSize: fontSize, color: color));
}

