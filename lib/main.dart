import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});


  @override
  State<Home> createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  TextEditingController usuarioController = new TextEditingController();
  TextEditingController senhaController = new TextEditingController();
  String _textoInfo = "Informe seus dados";


  void _cadastrar_usuario(){
    usuarioController.text = "";
    senhaController.text = "";
    setState((){
      _textoInfo = "Usuário cadastrado com sucesso!";

    });
  }
  void _limpar_Tela (){
    usuarioController.text = "";
    senhaController.text = "";
    setState(() {
      _textoInfo = "Informe seus dados.";
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de Usuário"),
        centerTitle: true,
        backgroundColor: Colors.yellow,
        actions: <Widget>[
          IconButton(onPressed: _limpar_Tela, icon: const Icon(Icons.refresh)
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            const Icon(
              Icons.person_outline,
              size: 170.0,
              color: Colors.yellow,
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Usuário:",
                labelStyle: TextStyle(color: Colors.yellow),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0),
              controller: usuarioController,
            ),
            //Segunda Input para a usuario
            TextField(
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Senha:",
                labelStyle: TextStyle(color: Colors.yellow),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0),
              controller: senhaController,
            ),

            //Botão para executar o cadastro
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: SizedBox(
                height: 50.0,

                child: ElevatedButton(
                  onPressed: _cadastrar_usuario,
                  child: const Text("Cadastrar"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.yellow),
                  ),
                ),
              ),
            ),

            Text(
              _textoInfo,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 25.0,
              ),
            )
          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

