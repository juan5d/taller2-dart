import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  String operaciones = "";
  bool estado=false;

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
       title: Text("Calculadora"),
      ),
      body: _body(),
    );
  }

  Widget _body(){
    return Column(
      children:[
        Expanded(
                  child: Container(
            color: Colors.red,
          ),
        ),
        Container(
          color: Colors.blue,
          height: 100,
          child: Row(
            children: [
              Text(operaciones),
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: () {
                    setState(() {
                      if(estado==false){
                        operaciones="";
                        estado=true;
                      }
                      operaciones += "7";
                      
                    });
                  }, child: Text("7") ),
                  ElevatedButton(onPressed: () {
                    setState(() {
                      if(estado==false){
                        operaciones="";
                        estado=true;
                      }
                      operaciones += "8";
                    });
                  }, child: Text("8")),
                  ElevatedButton(onPressed: () {
                    setState(() {
                      if(estado==false){
                        operaciones="";
                        estado=true;
                      }
                      operaciones += "9";
                    });
                  }, child: Text("9")),
                  ElevatedButton(onPressed: () {
                    setState(() {
                      operaciones += " / ";
                      estado=true;
                    });
                  }, child: Text("/")),
                ]
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: () {
                    setState(() {
                      if(estado==false){
                        operaciones="";
                        estado=true;
                      }
                      operaciones += "4";
                    });
                  }, child: Text("4") ),
                  ElevatedButton(onPressed: () {
                    setState(() {
                      if(estado==false){
                        operaciones="";
                        estado=true;
                      }
                      operaciones += "5";
                    });
                  }, child: Text("5")),
                  ElevatedButton(onPressed: () {
                    setState(() {
                      if(estado==false){
                        operaciones="";
                        estado=true;
                      }
                      operaciones += "6";
                    });
                  }, child: Text("6")),
                  ElevatedButton(onPressed: () {
                    setState(() {
                      operaciones += " * ";
                      estado=true;
                    });
                  }, child: Text("*")),
                ]
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: () {
                    setState(() {
                      if(estado==false){
                        operaciones="";
                        estado=true;
                      }
                      operaciones += "1";
                    });
                  }, child: Text("1") ),
                  ElevatedButton(onPressed: () {
                    setState(() {
                      if(estado==false){
                        operaciones="";
                        estado=true;
                      }
                      operaciones += "2";
                    });
                  }, child: Text("2")),
                  ElevatedButton(onPressed: () {
                  setState(() {
                      if(estado==false){
                        operaciones="";
                        estado=true;
                      }
                      operaciones += "3";
                    });
                  }, child: Text("3")),
                  ElevatedButton(onPressed: () {
                  setState(() {
                      operaciones += " - ";
                      estado=true;
                    });
                  }, child: Text("-")),
                ]
              ),Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: () {
                    setState(() {
                      if(estado==false){
                        operaciones="";
                        estado=true;
                      }
                      operaciones += "0";
                    });
                  }, child: Text("0") ),
                  ElevatedButton(onPressed: () {
                    setState(() {
                      operaciones= "";
                      estado=true;
                  });}, child: Text("C")),
                  ElevatedButton(onPressed: () {
                    setState(() {
                      
                      var operaciones2= operaciones.replaceAll("-", ",").replaceAll("+", ",").replaceAll("*", ",").replaceAll("/", ",").replaceAll(" ", "");
                      var array=operaciones2.split(",");
                      var valores1 = operaciones.replaceAll(" ", ",");
                      var valores = valores1.split(',') ;
                      print(valores);
                      var total;
                      print(array);
    print("tamaño");
    print(valores.length);
                      for (var i = 2; i <valores.length;i++) {
                        
                      if (i==2) {
                          total= casos(int.parse(valores[0]),valores[1],int.parse(valores[2]));
                        i=i+1;
                        }
                      if(i>2 && i<valores.length){
                        
                        total=casos(total,valores[i],int.parse(valores[i+1]));
                     i=i+1;
                        
                      }


                      }
                      operaciones=total.toString();
                      estado=false;
                      
                    });
                  }, child: Text("=")),
                  ElevatedButton(onPressed: () {
                    setState(() {
                      operaciones += " + ";
                      estado=true;
                    });
                  }, child: Text("+")),
                ]
              )

          ],),
        )
      ],
    );
  }
}

int casos(var valor1, String operador,var valor2){
  var total;
  print("operacion");
  print(valor1);
  print(valor2 );
  print(operador);
  switch(operador){
                        case '-': 
                          total = valor1 - valor2;
                        break;
                        case '+': 
                          total =  valor1 + valor2;
                        break;
                        case '*': 
                          total =  valor1 * valor2;
                        break;
                        case '/': 
                          total =  valor1 /  valor2;
                        break;
                      }
                      return total;
}
