import 'dart:math';

import 'package:flutter/material.dart';

import 'Calculator_button.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() =>_CalculatorScreenState();


}
class _CalculatorScreenState extends State<CalculatorScreen> {
  String textbtn="";


  //CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        toolbarHeight: 80,
        title: const Center(child: Text('Calculator',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),)),
      ),
      body:  Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(child:
                Text(textbtn,style:
                const TextStyle(fontSize: 30)),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                calculatorButton(text: 'AC',onBTNClick: onAcClick,),
                calculatorButton(text: 'C',onBTNClick: onCclick,),
                calculatorButton(text: '^2',onBTNClick: onSecondPower,),
                calculatorButton(text: 'Sqrt',onBTNClick: onSqrtClick,),

              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                calculatorButton(text: '7',onBTNClick: onDigitClick,),
                calculatorButton(text: '8',onBTNClick: onDigitClick,),
                calculatorButton(text: '9',onBTNClick: onDigitClick,),
                calculatorButton(text: '/',onBTNClick: onOperatorClick,),

              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                calculatorButton(text: '4',onBTNClick: onDigitClick,),
                calculatorButton(text: '5',onBTNClick: onDigitClick,),
                calculatorButton(text: '6',onBTNClick: onDigitClick,),
                calculatorButton(text: '*',onBTNClick: onOperatorClick,),

              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                calculatorButton(text: '1',onBTNClick: onDigitClick,),
                calculatorButton(text: '2',onBTNClick: onDigitClick,),
                calculatorButton(text: '3',onBTNClick: onDigitClick,),
                calculatorButton(text: '-',onBTNClick: onOperatorClick,),

              ],
            ),
          ),
          Expanded (
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                calculatorButton(text: '.',onBTNClick: onDigitClick,),
                calculatorButton(text: '0',onBTNClick: onDigitClick,),
                calculatorButton(text: '=',onBTNClick: onEqualClick,),
                calculatorButton(text: '+',onBTNClick: onOperatorClick,),

              ],
            ),
          ),
        ],
      ),
    );
  }


  void onDigitClick (String str){

    //print('$str');
    // print('$textbtn');

    textbtn+=str;
    setState(() {});
  }

  String savedNumber="";
  String savedOperator="";

  void onOperatorClick(String btnText){
    if(savedNumber.isEmpty){
      savedNumber=textbtn;
      savedOperator=btnText;
      textbtn="";
      setState(() { });
    }else{
      String newNumber=textbtn;
     var result= calculate(savedNumber,savedOperator,newNumber);
       savedNumber=result;
       savedOperator=btnText;
       textbtn="";
    }
    setState(() {
    });
  }



  String calculate(String lhs, String op, String rhs) {
    double n1=double.parse(lhs);
    double n2=double.parse(rhs);

        double res=0;
        if(op=="+"){
          res=n1+n2;
        }else if(op=="-"){
          res=n1-n2;
        }else if(op=="*"){
          res=n1*n2;
        }else if(op=="/"){
          res=n1/n2;
        }
        return res.toString();
      }

      onEqualClick(String btnText){
        String newNumber=textbtn;
        var result= calculate(savedNumber,savedOperator,newNumber);
        textbtn=result;
        savedNumber="";
        savedOperator=btnText;
       // textbtn="";
        setState(() {

        });
      }

  void onAcClick (String str){
    textbtn="";
    setState(() {
    });
  }

  void onCclick(String str){
    textbtn=textbtn.substring(0,textbtn.length-1);
    setState(() {
    });
  }

  void onSecondPower(String str){
    double x = double.parse(textbtn);
    savedNumber = (pow(x, 2).toString());
    textbtn = savedNumber;
    setState(() {});
  }

  void onSqrtClick(String str){
    double y=double.parse(textbtn);
    textbtn=(sqrt(y)).toString();
    setState(() {});
  }



}
