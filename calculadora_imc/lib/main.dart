import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Calculadora para alunos',
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _nota1Controller = TextEditingController();
  TextEditingController _nota2Controller = TextEditingController();

  GlobalKey<FormState> _keyy = GlobalKey<FormState>();

  String _info = 'A sua média aparece aqui!';

  void _reset(){
    setState(() {
      _nota1Controller.text = "";
      _nota2Controller.text = "";
      _info = 'A sua média aparece aqui!';

    });
  }

  void _calculate(){
    setState(() {
      double nota1 = double.parse(_nota1Controller.text);
      double nota2 = double.parse(_nota2Controller.text);
      double media = (nota1 + nota2) / 2;
      if(media >= 7.0){
        _info = 'Você está aprovado!';
      }
      else if(media < 7.0 && media >= 6.0){
        _info = 'Você está de recuperação';
      }
      else if(media < 6.0){
        _info = "Você está reprovado!";
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora para alunos'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _reset,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
            key: _keyy,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Icon(
                    Icons.scanner,
                    size: 120.0,
                    color: Colors.blue,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Nota 1',
                      labelStyle: TextStyle(color: Colors.blue, fontSize: 25.0),
                    ),
                    textAlign: TextAlign.center,
                    controller: _nota1Controller,
                    validator: (value){
                      if(value.isEmpty){
                        return 'Insira a nota 1';
                      }
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Nota 2',
                      labelStyle: TextStyle(color: Colors.blue, fontSize: 25.0),
                    ),
                    textAlign: TextAlign.center,
                    controller: _nota2Controller,
                    validator: (value){
                      if(value.isEmpty){
                        return 'Insira a nota 2!';
                      }
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                    child: Container(
                      height: 50.0,
                      child: RaisedButton(
                        onPressed: () {
                          if(_keyy.currentState.validate()){
                            _calculate();
                          }
                        },
                        child: Text('Verificar',
                          style: TextStyle(color: Colors.white, fontSize: 25.0),),
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 30.0),
                    child:Text(_info,
                      style: TextStyle(color: Colors.blue, fontSize: 25.0),
                      textAlign: TextAlign.center,),
                  ),
                ])),
      ),
    );
  }
}
