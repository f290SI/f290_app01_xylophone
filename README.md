# App01 - Xylophone

Projeto Flutter utilizando recusros externos via [PubDev](https://pub.dev/packages/audioplayers/install) para inclusão de dependencias externas.

Neste projeto utilizamos princípios básicos de [Layout em Flutter](https://flutter.dev/docs/development/ui/layout) utilizando os Widgets [Column](https://api.flutter.dev/flutter/widgets/Column-class.html) e [Row](https://api.flutter.dev/flutter/widgets/Row-class.html)

## Tutorial


### Criar projeto
Como de praxe, com a combinação de teclas `Alt + Shift+ P`, selecione um novo projeto **Flutter**, informe o diretorio de destino e espere o build.

### Utilizando o código nencessário
Por padrão um novo projeto trás a aplicação **Counter** ja implementada.
Ela utiliza o conceito de `StateFull Widgets` e ainda não precisamos utilizálos, então vamos utilizar o mímino necessário.
Remova todo ocódigo do arquivo `lib/main.dart`.

### Widget Main
Vamos criar a aestrutura básica:

1. Faça o import do `Material` e crie o método `main`, já adicionando o elemento principal ao `home`, o **Scaffold**
```javascript
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Xylophone'),
        ),       
      ),
    );
  }
}
```
2. Adicione uma coluna ao `body`.
```javascript
        body: Column(
          children: [],
        ),
``` 
3. Se código estará assim:
```javascript
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Xylophone'),
        ),
        body: Column(
          children: [],
        ),
      ),
    );
  }
}
```
4. Tudo pronto! Agora vamos criar o Layout.

### Criando o Layout
#### Ajustando a coluna para acomodar as teclas do Xylophone
Como estamos utilizando uma coluna e ela será única neste projeto, para facilitar vamos fazer com que todos os elemento da Coluna sejam **estirados** com a propriedade `STRETCH`.
1. Acima do `children`, adicione o código abaixo:
```javascript
crossAxisAlignment: CrossAxisAlignment.stretch,
```
2. Seu código digo deverá ficar assim no método `build`:
```javascript
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App 01'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //Restante do código aqui...
        ],
      ),
    );
  }
```
3. Tudo certo aqui! Agora é hora de incluir as dependencias!

##### Adicionando a dependencia AudioCache
Vamos adicionar o pacote `AudioCache` para executar os audios de forma mais simples.
1. Acesse o site [PubDev](https://pub.dev/packages/audioplayers) para visualizar as informações de instalaçao o pacote.
2. Acesse o arquivo `pubsoec.yaml` e adicione o código abaixo embaixo da linha dos icones cupertino:
```shell 
  cupertino_icons: ^1.0.2
  audioplayers: ^0.15.0
```
3. Save o arquivo e verifique se as dependencias estao sendo baixadas.
4. Caso não forem baixadas acesse o terminal e execute o comando `flutter pub get`. Este comando ira baixar as dependencias externas.
5. No arquivo `lib/main.dart` adicione a dependencia no topo do arquivo `import 'package:audioplayers/audio_cache.dart';`.

#### Adicionando os ASSETS
Assets são recursos adicionais do nosso projeto, vamos adicionar os sons para serem executados.
1. Na raiz do app, crie a pasta `assets`.
2. No arquivo `pubspec.yaml` descomente a linha dos assets e deixe-a da seguinte forma:
```shell
  assets:
    - assets/
```
3. Save o arquivo e verifique se as dependencias estao sendo baixadas.
4. Caso não forem baixadas acesse o terminal e execute o comando `flutter pub get`. Este comando irá configurar as dependencias internas.

#### Criando os botões
Anteriormente haviamos criado containers para exibir as teclas, mas precisamos de multiplos botões e cada botão deve ter um código para executar um audio em especifico, precisamos de um componente próprio; para tal vamos criar um método que recebe os argumento que precisamos e devolver um Widget que retorna o botão com o evento de executar o audio já incluso. 
1. Adicione o código abaixo no final da classe, mas se liga, deve estar dentro da classe pois é uma função:
```javascript
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
```
#### Distribuindo os botões
1. Dentro de `chilren[]`, no `body` do App, adicione os botões, ou seja faça chamadas à função que criará os widgets para preecher a coluna e executar os sons, adicione o código abaixo:
```javascript
coloredButton(cor: Colors.red, numeroSom: 1),
coloredButton(cor: Colors.orange, numeroSom: 2),
coloredButton(cor: Colors.yellow, numeroSom: 3),
coloredButton(cor: Colors.green.shade400, numeroSom: 4),
coloredButton(cor: Colors.teal.shade600, numeroSom: 5),
coloredButton(cor: Colors.blue.shade600, numeroSom: 6),
coloredButton(cor: Colors.purple, numeroSom: 7),
```

#### Terminamos
Seu código deve estar assim:
```javascritp
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

#### Teste no seu dispositivo 
```




