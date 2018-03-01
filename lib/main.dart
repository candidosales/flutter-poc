import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome',
      theme: new ThemeData(
        primaryColor: Colors.orangeAccent,
      ),
      home: new RandomWords()
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold (
    body: new ExampleWidget(),
    );
  }
}

class ExampleWidget extends StatefulWidget {
  ExampleWidget({Key key}) : super(key: key);

  @override
  _ExampleWidgetState createState() => new _ExampleWidgetState();
}

/// State for [ExampleWidget] widgets.
class _ExampleWidgetState extends State<ExampleWidget> {
  final TextEditingController _controllerCpf = new TextEditingController();
  final TextEditingController _controllerPassword = new TextEditingController();
  @override
  Widget build(BuildContext context) {


    return new Container(
      constraints: new BoxConstraints.expand(),
      padding: const EdgeInsets.all(32.0),
      alignment: Alignment.center,
      child: _buildInputs(),
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          begin: const Alignment(0.0, -1.0),
          end: const Alignment(0.0, 0.6),
          colors: <Color>[
            const Color(0xffe6643d),
            const Color(0xfffdb346)
          ],
        )
      ),
    );
  }

  Widget _buildCenter() {
    return new Row(
        // <Widget> is the type of items in the list.
        children: <Widget>[
          new IconButton(
            icon: new Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null, // null disables the button
          ),
          // Expanded expands its child to fill the available space.
          new Expanded(
            child: title,
          ),
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
  }

  Widget _buildInputs() {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new TextField(
          controller: _controllerCpf,
          decoration: new InputDecoration(
            icon: const Icon(Icons.person),
            hintText: 'CPF',
            labelText: 'CPF',
          ),
        ),
        new TextField(
          controller: _controllerPassword,
          decoration: new InputDecoration(
            icon: const Icon(Icons.lock),
            hintText: 'Senha',
            labelText: 'Senha',
            fillColor: Colors.white
          ),
          obscureText: true,
        ),
        new RaisedButton(
          onPressed: () {
            showDialog(
              context: context,
              child: new AlertDialog(
                title: new Text('CPF'),
                content: new Text(_controllerCpf.text),
              ),
            );
          },
          child: new Text('DONE'),
        ),
      ],
    );
  }
}