import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/Constants.dart';
import 'package:foodapp/size_config.dart';
import 'package:math_expressions/math_expressions.dart';
//import 'package:foodapp/size_config.dart';

class FirstRoute extends StatefulWidget {
  @override
  _FirstRouteState createState() => _FirstRouteState();
}

class _FirstRouteState extends State<FirstRoute> {
  bool loading = true;
  String _history = "";
  String expression = "";
   Function callback;
   String history;
   String answer;

   numbers(buttonNumber) {
      setState(() {
        _history += buttonNumber;
        answer=_history;

      });
  }
   allClear(buttonNumber){
    setState(() {
      answer="";
      _history="";
      expression="";
      //expression="";
    });
  }
  evaluate (String buttonNumber){
    Parser p =  Parser();
    Expression exp = p.parse(_history);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
     setState(() {
       _history = expression;
       expression=eval.toString();
      // print("this is expression");
     });
  }


  Widget buildContainer(
      {@required Color color, @required String buttonNumber,int onFlex,AlignmentGeometry textAlignment=Alignment.center,Function callback}) {
    return Expanded(
      flex: onFlex,
      child: GestureDetector(
        onTap: () {
           callback(buttonNumber);
        },
        child: Container(
          //alignment: alignmentText,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(50),
            //border: Border.all(color: Colors.white),
          ),
          height:SizeConfig.init(context).height(0.1),
          width: SizeConfig.init(context).width(0.19),
          child: Padding(
            padding: EdgeInsets.only(left:textAlignment==Alignment.center?0:22),
            child: Align(
              alignment: textAlignment,

              child: Text(buttonNumber.toString(),
                style: kSplshScreenText,
              ),
            ),
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  color: Colors.white.withOpacity(0.2),
                  height: 100,
                  width: double.infinity,
                  child: Text(answer.toString(),
                    style: kButtonTextStyle,
                  ),
                ),
                Divider(
                  color: Colors.white,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  height: 50,
                  color: Colors.white.withOpacity(0.2),
                  child: Text(expression,
                    style: kButtonTextStyle,
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,

                      ),
                      Row(
                        children: [
                          buildContainer(
                              color: Colors.white.withOpacity(0.5),
                              buttonNumber: "AC".toString(),
                            callback:allClear,
                          ),
                          buildContainer(
                              color: Colors.white.withOpacity(0.5),
                              buttonNumber: "C",
                          ),
                          buildContainer(
                              color: Colors.white.withOpacity(0.5),
                              buttonNumber: "%",
                            callback: numbers,
                          ),
                          buildContainer(
                              color: Colors.white.withOpacity(0.5),
                              buttonNumber: "/",
                          callback: numbers,
                          ),
                        ],
                      ),
                      Row(
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          buildContainer(
                            color: Colors.white.withOpacity(0.2),
                            buttonNumber : "1",
                            callback: numbers,

                          ),
                          buildContainer(
                            color: Colors.white.withOpacity(0.2),
                            buttonNumber: "2",
                            callback: numbers,
                          ),
                          buildContainer(color: Colors.white.withOpacity(0.2),
                              buttonNumber: "3",
                          callback: numbers,
                          ),
                          buildContainer(color: Color(0xFFFF9500),
                              buttonNumber: "+",
                          callback:numbers,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          buildContainer(color: Colors.white.withOpacity(0.2),
                              buttonNumber: "4",
                            callback: numbers,
                          ),
                          buildContainer(color: Colors.white.withOpacity(0.2),
                              buttonNumber: "5",
                            callback: numbers,
                          ),
                          buildContainer(color: Colors.white.withOpacity(0.2),
                              buttonNumber: "6",
                            callback: numbers,
                          ),
                          buildContainer(color: Color(0xFFFF9500),
                              buttonNumber: "%",
                            callback: numbers,

                          ),

                        ],
                      ),
                      Row(
                        children: [
                          buildContainer(color: Colors.white.withOpacity(0.2),
                              buttonNumber: "7",
                            callback: numbers,
                          ),
                          buildContainer(color: Colors.white.withOpacity(0.2),
                              buttonNumber: "8",
                            callback: numbers,
                          ),
                          buildContainer(color: Colors.white.withOpacity(0.2),
                              buttonNumber: "9",
                            callback: numbers,
                          ),
                          buildContainer(color: Color(0xFFFF9500),
                              buttonNumber: "-",
                          callback: numbers,
                          ),

                        ],
                      ),
                      Row(
                        children: [
                          buildContainer(
                              color: Colors.white.withOpacity(0.2),
                              buttonNumber: "0",
                            callback: numbers,
                            onFlex: 2,
                            textAlignment: Alignment.centerLeft,
                          ),

                          buildContainer(color: Colors.white.withOpacity(0.2),
                              buttonNumber: "."),
                          buildContainer(color: Color(0xFFFF9500),
                              buttonNumber: "=",
                            callback: evaluate,
                          ),

                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}