
// ignore_for_file: file_names, missing_return

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class TextFunctions{

  static user(TextEditingController controller,{required String label,required bool obscure,required Widget icon,required Color colors} ){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.normal),
        controller:controller,
        obscureText: obscure,
        decoration: InputDecoration(
          labelText:label,labelStyle: TextStyle(fontSize: 14,fontFamily: 'ExpoArabicBook',),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(color: colors,)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(color:colors,width: 0.2)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18.0),
              borderSide: BorderSide(width: 0.4,
                  color: colors)),
          suffixIcon:icon,
        ),

      ),
    );
  }
  static rememberMe({required String title,required BuildContext context,required Function(bool?) press,required bool isCheck}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.all(1.0),
        child:SizedBox(
            child: Theme(
              data: ThemeData(unselectedWidgetColor: Colors.grey),
              child: Checkbox(
                  shape: CircleBorder(),
                  activeColor: Color(0XFF156CF3),
                  value: isCheck,
                  onChanged:press),
            )),
      ),
      SizedBox(width: 5.0),
      Text(title, style: TextStyle(fontSize: 14,fontFamily: 'ExpoArabicBook')),

    ],);
  }
  static agreeToConditin({required bool isCheck,required Function(bool?) press}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.all(1.0),
        child: SizedBox(
            child: Theme(
              data: ThemeData(unselectedWidgetColor: Colors.grey),
              child: Checkbox(
                  shape: CircleBorder(),
                  activeColor: Color(0XFF156CF3),
                  value: isCheck, onChanged: press,
                  ),)),
      ),
      SizedBox(width: 5.0),
      Text('الموافقة على'),
      Text("الشروط والأحكام", style: TextStyle(fontSize: 14,fontFamily: 'ExpoArabicBook',color: Colors.blueAccent,decoration: TextDecoration.underline,)),

    ],);
  }
}


class PrimaryButton extends StatelessWidget{
  final String text;
  Color color;
  Function() onPressed;
  PrimaryButton({Key? key,required this.text,required this.onPressed,required this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(padding: EdgeInsets.symmetric(vertical: 10),
        width:380,height: 84,
        child:ElevatedButton(
          child: Text(
              text,
              style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white,fontFamily: 'ExpoArabicBook')),
          style: ButtonStyle(
              shape:MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius:  BorderRadius.circular(18),)) ,
              backgroundColor: MaterialStateProperty.all(color)
          ),
          onPressed:onPressed,

        ),),);
  }
}
