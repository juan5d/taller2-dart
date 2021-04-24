import 'package:flutter/material.dart';

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
                        try {
                          total= casos(double.parse(valores[0]),valores[1],double.parse(valores[2]));
                        } catch (e) {
                          print(e);
                          total=0;
                          i=valores.length;
                          showDialog(context: context, builder: (_)=> AlertDialog());
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
                          showDialog(context: context, builder: (_)=> AlertDialog());
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
                      listaResultado.add(Text('Operacion:'));
                      listaResultado.add(Text("$operaciones"));
                      operaciones=total.toString();
                      listaResultado.add(Text('Total:'));
                      listaResultado.add(Text("$operaciones"));
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
