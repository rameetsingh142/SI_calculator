import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "si calculator",
    home: siform(),
    theme: ThemeData(
      primaryColor: Colors.purpleAccent[200],
      accentColor: Colors.purpleAccent,
      brightness: Brightness.dark
    ) ,
  ));
}

class siform extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return siFormState();
  }
}
class siFormState extends State<siform> {
  var currency = ["rupees", "dollar", "pounds"];
  final minpadding=25.0;
  var currentitemselected="rupees";
  var display='';
  TextEditingController principalcontrolled=TextEditingController();
    TextEditingController roicontrolled=TextEditingController();
      TextEditingController termcontrolled=TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    TextStyle textStyle=Theme.of(context).textTheme.title;
    return Scaffold(
     // resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("simple interest calculator"),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            getImageAsset(),
            Padding(padding: EdgeInsets.only(top:minpadding,bottom: minpadding),
              child:
            TextField(
              keyboardType:TextInputType.number ,
              style: textStyle,
              controller: principalcontrolled,
              decoration: InputDecoration(
                labelText: 'Principal',
                hintText: "Enter principal amount eg. 12000 ",
                labelStyle: textStyle,
                border: OutlineInputBorder( borderRadius: BorderRadius.circular(8.0))
              ),
            ),
            ),
             Padding( padding: EdgeInsets.only(top: minpadding, bottom: minpadding),
               child:
             TextField(
              keyboardType:TextInputType.number ,
               style: textStyle,
               controller: roicontrolled,
              decoration: InputDecoration(
                labelText: 'Rate of Intrest',
                hintText: "Enter rate of intrest",
                labelStyle: textStyle,
                border: OutlineInputBorder( borderRadius: BorderRadius.circular(8.0))
              ),
            ),
             ),
             Padding (padding: EdgeInsets.only(top:minpadding,bottom: minpadding),
             child:Row(
               children: <Widget>[
                Expanded(child: TextField(
              keyboardType:TextInputType.number ,
               style: textStyle,
               controller: termcontrolled,
              decoration: InputDecoration(
                labelText: 'Term',
                hintText: "Time in years",
                labelStyle: textStyle,
                border: OutlineInputBorder( borderRadius: BorderRadius.circular(8.0))
              ),
            ),
            ),
           Container(width: 25.0,),
            Expanded( child:DropdownButton<String>(
              items: currency.map((String value){
                return DropdownMenuItem<String>(
                  value: value,
                child: Text(value),
                );
              }).toList(),
              value: currentitemselected,

              onChanged: (String newValueSelected){
                dropdown(newValueSelected);
              }, 
            )
            ),
               ],
             ),
             ),
             Padding (padding: EdgeInsets.only(top: minpadding,bottom: minpadding),
               child:
             Row(children: <Widget>[
               Expanded( 
                 child: RaisedButton(
                   color: Theme.of(context).accentColor,
                   textColor: Theme.of(context).primaryColorDark,
                   child: Text("Calculate",textScaleFactor: 1.5,),
                   onPressed: (){
                     setState(() {
                      this.display= calculate();
                     });

                   },
                 ),
               ),
               Container(width: 25.0,),
               Expanded( 
                 child: RaisedButton(
                   color: Theme.of(context).primaryColorDark,
                   textColor: Theme.of(context).primaryColorLight,
                   child: Text("Reset", textScaleFactor: 1.5,),
                   onPressed: (){
                     setState(() {
                       reset();
                     });
                 },
                 ),
               )
             ],
             )
             ),
             Padding(padding: EdgeInsets.all(25.0),
             child: Text(this.display,style: textStyle,) ,
             )

          ],
        ),
      ),
    );
  }

  Widget getImageAsset() {
    return Container(
      width: 200.0,
      height: 200.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/90313.png')
        )
      ),
    );
  }
  void dropdown(String newValueSelected)
  { setState(() {
    this.currentitemselected=newValueSelected;
  });



  }
  String calculate(){
  double principal=double.parse(principalcontrolled.text);
    double roi=double.parse(roicontrolled.text);
      double term=double.parse(termcontrolled.text);
    double total=principal+(principal*roi*term)/100;
    String result="investment worth  $total $currentitemselected";
    return result;
  }
  void reset(){
    principalcontrolled.text="";
    roicontrolled.text="";
    termcontrolled.text="";
    display='';
    currentitemselected= currency[0];
  }
}
