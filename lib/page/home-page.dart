import 'dart:math';

import 'package:flutter/material.dart';
import 'package:taller2/page/resultados.dart';

class HomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  String operaciones = "";
  bool estado=false;
  List <Text>  listaResultado =[];

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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: listaResultado,
                    )
                  ],
                ),
              ),
              
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
                      operaciones += "";
                      
                    });
                  }, child: Text("CE") ),
                  ElevatedButton(onPressed: () {
                    setState(() {
                      operaciones= "";
                      estado=true;
                    });
                  }, child: Text("C")),
                  ElevatedButton(onPressed: () {
                    setState(() {
                        estado=true;
                      
                      operaciones += "√ ";
                    });
                  }, child: Text("√")),
                  ElevatedButton(onPressed: () {
                    setState(() {
                      operaciones += " ²";
                      estado=true;
                    });
                  }, child: Text("² ")),
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
                        operaciones=".";
                        estado=true;
                      }
                      operaciones += ".";
                    });
                  }, child: Text(".") ),
                  ElevatedButton(onPressed: () {
                    setState(() {
                      operaciones+= "0";
                      estado=true;
                  });}, child: Text("0")),
                  
                  ElevatedButton(onPressed: () {
                    setState(() {
                      var total;
                      var ant=operaciones;
                      var operaciones2= operaciones.replaceAll("²", ",").replaceAll("√", ",").replaceAll("-", ",").replaceAll("+", ",").replaceAll("*", ",").replaceAll("/", ",").replaceAll(" ", "");
                      var array=operaciones2.split(",");
                      var valores1 = operaciones.replaceAll(" ", ",");
                      var valores = valores1.split(',') ;
print("w");
    print(operaciones);
                      if(valores.length>=3){
                      print(valores);
                      
    print("tamaño");
    print(valores.length);
                      for (var i = 2; i <valores.length;i++) {
                        
                      if (i==2) {
                        try {
                          total= casos(double.parse(valores[0]),valores[1],double.parse(valores[2]));
                        } catch (e) {
                          print(e);
                          total=0;
                          i=valores.length;
                          showDialog(context: context, builder: (_)=> AlertDialog(
                        title: Text("Error"),
                        content: Text("No se tuvo una buena redaccion en la operacion"),
                        actions: [
                          FlatButton(onPressed: (){
                            Navigator.of(context).pop();
                            operaciones="";
                          }, child: Text("Cerrar")),
                        ],
                        elevation: 24.0,
                      ),);
                        }
                          
                        i=i+1;
                        }
                      if(i>2 && i<valores.length){
                        try {
                          total=casos(double.parse(total),valores[i],double.parse(valores[i+1]));
    
                        } catch (e) {
                          print(e);
                          total=0;
                          i=valores.length;
                          showDialog(context: context, builder: (_)=> AlertDialog(
                        title: Text("Error"),
                        content: Text("No se tuvo una buena redaccion en la operacion"),
                        actions: [
                          FlatButton(onPressed: (){
                            Navigator.of(context).pop();
                            operaciones="";
                          }, child: Text("Cerrar")),
                        ],
                        elevation: 24.0,
                      ),);
                        }
                                         i=i+1;
                        
                      }


                      }
                      if(total=="no"){
                        total="Division por 0 no esta contemplada ";
                      showDialog(context: context, builder: (_)=> AlertDialog(
                        title: Text("Error"),
                        content: Text("Division por 0"),
                        actions: [
                          FlatButton(onPressed: (){
                            Navigator.of(context).pop();
                            operaciones="";
                          }, child: Text("Cerrar")),
                        ],
                        elevation: 24.0,
                      ),);
                      }
                      estado=false;
                      }
else{
  
  total= validarOperacionesCuadraticas(operaciones).toString();
                      
                      
                      
}
listaResultado.add(Text("$ant"+"="+"$total",
    style: TextStyle(color: Colors.blue, fontSize:20),));

operaciones=ant+" = "+total.toString();


                    });
                  }, child: Text("=")),
                  ElevatedButton(onPressed: () {
                    setState(() {
                      operaciones += " + ";
                      estado=true;
                    });
                  }, child: Text("+")),
                ]
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed:() {
                    Navigator.push(context, 
                    MaterialPageRoute(
                      builder: (context)=>ResultadosPage(
                      listadoResultados:listaResultado
                    )));
                  }, child: Text("Mostrar Resultados"))
                ],
              )

          ],),
        )
      ],
    );
  }
}

String casos(var valor1, String operador,var valor2){
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
                        if(valor2!=0){
                          total =  valor1 /  valor2;
                        }
                        else{
                          total="no";
                        }
                        break;
                      }
                      return total.toString();
}
num validarOperacionesCuadraticas(String numeroCuadratico) {
    num resultado;
    print(numeroCuadratico);
    if (numeroCuadratico.contains("²")) {
      var numero = double.parse(numeroCuadratico.split("²")[0]);
      resultado = numero * numero;
      resultado = resultado % 1 == 0 ? resultado.round() : resultado;
      return resultado;
    }

    if (numeroCuadratico.contains("√")) {
      var numero = double.parse(numeroCuadratico.split("√")[1]);
      resultado = sqrt(numero);
      resultado = resultado % 1 == 0 ? resultado.round() : resultado;
      return resultado;
    }
    return double.parse(numeroCuadratico);
  }
