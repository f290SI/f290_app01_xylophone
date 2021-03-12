import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App 01'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          coloredButton(cor: Colors.red, numeroSom: 1),
          coloredButton(cor: Colors.orange, numeroSom: 1),
          coloredButton(cor: Colors.yellow, numeroSom: 1),
          coloredButton(cor: Colors.green.shade400, numeroSom: 1),
          coloredButton(cor: Colors.teal.shade600, numeroSom: 1),
          coloredButton(cor: Colors.blue.shade600, numeroSom: 1),
          coloredButton(cor: Colors.purple, numeroSom: 1),
        ],
      ),
    );
  }

  void play(int number) {
    var player = AudioCache();
    player.play('note$number.wav');
  }

  Widget coloredButton({Color cor, int numeroSom}) {
    return Expanded(
      child: FlatButton(
        color: cor,
        onPressed: () {
          play(numeroSom);
        },
        child: null,
      ),
    );
  }
}
